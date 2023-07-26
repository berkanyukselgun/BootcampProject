import 'dart:async';

import 'package:akademi_bootcamp/core/model/message_model.dart';
import 'package:akademi_bootcamp/core/model/user_model.dart';
import 'package:akademi_bootcamp/core/services/auth/auth_service.dart';
import 'package:akademi_bootcamp/core/services/firestore/firestore_manager.dart';
import 'package:akademi_bootcamp/core/services/notification/notification_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import '../../model/event_model.dart';
import '../../model/group_model.dart';

class EventsService {
  EventsService._();
  static late final EventsService instance = EventsService._();
  final GROUPS = 'groups';
  final USERS = 'users';
  final FAV_EVENTS = 'fav_events';

  Future<int> updateUserFavList(EventModel eventModel, bool adding) async {
    UserModel? user = AuthService.instance.currentUser;
    List<EventModel> favList = [];
    if (user != null) {
      if (user.favEvents == null && adding) {
        favList.add(eventModel);
        user.favEvents = favList;
        scheduleNotificationForEvent(eventModel);
      } else if (user.favEvents != null && adding) {
        favList = user.favEvents!;
        favList.add(eventModel);
        scheduleNotificationForEvent(eventModel);
      } else {
        //removing
        favList = user.favEvents!;
        favList.removeWhere((event) => event.id == eventModel.id);

        leaveChatGroup(eventModel.id.toString(), user.userID!);
      }
      final docFavList = [];

      for (final event in favList) {
        docFavList.add(event.toJson());
      }
      await FirestoreManager.instance.firestoreUpdateOneField(collectionID: USERS, docID: user.userID!, key: FAV_EVENTS, value: docFavList);
      if (adding && eventModel.id != null && user.userID != null) {
        joinChatGroup(eventModel, user.userID!);
      }
      if (favList.isEmpty) {
        return -1; // there is no fav
      }
      return 1;
    }
    return 0;
  }

  void scheduleNotificationForEvent(EventModel eventModel) {
    DateTime parsedDate = DateFormat("yyyy-MM-dd'T'HH:mm:ssZ").parse(eventModel.start!);
    DateTime notificationDateOneDayBefore = parsedDate.subtract(Duration(days: 1));
    DateTime notificationDateSixHoursBefore = parsedDate.subtract(Duration(hours: 6));

    if (notificationDateOneDayBefore.isAfter(DateTime.now())) {
      NotificationService.instance.scheduleNotification(
        scheduledNotificationDateTime: notificationDateOneDayBefore,
        title: "Favori etkinliğin yarın!",
        body: "${eventModel.name} etkinliğine hazır mısın? Grupta neler konuşuluyor acaba?",
      );
    }
    if (notificationDateSixHoursBefore.isAfter(DateTime.now())) {
      NotificationService.instance.scheduleNotification(
        scheduledNotificationDateTime: notificationDateSixHoursBefore,
        title: "Favori etkinliğine son 6 saat!",
        body: "${eventModel.name} etkinliğine hazır mısın? Grupta neler konuşuluyor acaba?",
      );
    }
  }

  Stream<QuerySnapshot<Object?>>? fetchUserGroups() {
    UserModel? user = AuthService.instance.currentUser;

    if (user != null && user.favEvents != null && user.favEvents!.isNotEmpty) {
      List<String> favEventIds = user.favEvents!.map((event) => event.id.toString()).toList();

      return FirestoreManager.instance.firestoreGetSomeDocumentsAsStream(collectionID: "groups", whereIn: favEventIds);
    }
    return null;
  }

  Future<MessageModel?> fetchLastMessage(String eventID) async {
    CollectionReference<Map<String, dynamic>> collection = await FirestoreManager.instance.firestoreGetCollectionInCollection(outerID: "groups", innerID: "messages", docID: eventID);
    final QuerySnapshot snapshot = await collection.orderBy('time', descending: true).limit(1).get();
    if (snapshot.docs.isNotEmpty) {
      final messageData = snapshot.docs.first.data() as Map<String, dynamic>;
      return MessageModel.fromJson(messageData);
    } else {
      return null;
    }
  }

  Future<void> joinChatGroup(EventModel eventModel, String userID, {bool alreadyFav = false}) async {
    if (eventModel.id != null) {
      DocumentSnapshot groupSnapshot = await FirestoreManager.instance.firestoreGetDocument(collectionID: GROUPS, docID: eventModel.id.toString());
      UserModel? currentUser = AuthService.instance.currentUser;
      if (groupSnapshot.exists) {
        GroupModel group = GroupModel.fromJson(groupSnapshot.data() as Map<String, dynamic>);
        List<SentBy> users = group.users ?? [];
        bool userExists = users.any((user) => user.id == userID);
        if (!userExists && currentUser != null) {
          users.add(SentBy(fullname: currentUser.fullname, id: currentUser.userID, photoUrl: currentUser.photoUrl));
          Map<String, dynamic> updatedData =
              alreadyFav ? {'users': users.map((user) => user.toJson()).toList()} : {'users': users.map((user) => user.toJson()).toList(), 'fav_count': FieldValue.increment(1)};
          await groupSnapshot.reference.update(updatedData);
        }
      } else if (currentUser != null) {
        await FirestoreManager.instance.firestoreSendDataMap(collectionID: GROUPS, docID: eventModel.id.toString(), data: {
          'users': [SentBy(fullname: currentUser.fullname, id: currentUser.userID, photoUrl: currentUser.photoUrl).toJson()],
          'event': eventModel.toJson(),
          'messages': [],
          'fav_count': 1
        });
      }
    }
  }

  void leaveChatGroup(String eventID, String userID, {bool stillInFav = false}) async {
    dynamic data = await FirestoreManager.instance.firestoreGetDocumentData(collectionID: GROUPS, docID: eventID);
    if (data != null) {
      List<SentBy> users = (data[USERS] as List<dynamic>).map((item) => SentBy.fromJson(item)).toList();
      users.removeWhere((user) => user.id == userID);
      List<Map<String, dynamic>> updatedUsers = users.map((user) => user.toJson()).toList();
      Map<String, dynamic> updatedData = stillInFav ? {'users': updatedUsers} : {'users': updatedUsers, 'fav_count': FieldValue.increment(-1)};
      await FirestoreManager.instance.firestoreUpdateFields(collectionID: GROUPS, docID: eventID, fields: updatedData);
    }
  }

  pushMessage(String eventID, MessageModel message) async {
    await FirestoreManager.instance.firestoreAddDocCollectionInCollection(outerID: "groups", innerID: "messages", docID: eventID, data: message.toJson());
  }

  Stream<List<MessageModel>> getGroupChatsStream(String eventID) {
    StreamController<List<MessageModel>> controller = StreamController<List<MessageModel>>();
    FirestoreManager.instance
        .firestoreStreamCollectionInCollection(
      outerID: "groups",
      innerID: "messages",
      docID: eventID,
    )
        .listen((QuerySnapshot<Object?> snapshot) {
      List<MessageModel> messages = snapshot.docs.map((doc) => MessageModel.fromJson(doc.data() as Map<String, dynamic>)).toList();
      controller.add(messages);
    }, onError: (error) {
      controller.add([]);
    });

    return controller.stream;
  }

  Future<List<GroupModel>> fetchSomeGroups(List<String> docIds) async {
    List<QueryDocumentSnapshot<dynamic>> documents = await FirestoreManager.instance.firestoreGetSomeDocuments(collectionID: "groups", whereIn: docIds);
    List<GroupModel> groupList = [];
    documents.forEach((doc) {
      GroupModel groupModel = GroupModel.fromJson(doc.data() as Map<String, dynamic>);
      groupList.add(groupModel);
    });
    return groupList;
  }
}
