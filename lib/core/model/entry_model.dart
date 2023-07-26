import '../constants/image/image_constants.dart';

class EntryModel {
  final String image, title, description;
  EntryModel({required this.image, required this.title, required this.description});
}

final List<EntryModel> demo_data = [
  EntryModel(
    image: ImageConstants.ENTRY_MAP,
    title: "view events on the map",
    description: "When you become a member, you will be\n able to see the events on the map!",
  ),
  EntryModel(
    image: ImageConstants.ENTRY_TICKET,
    title: "If you want you can buy the ticket",
    description: "You will be able to buy your ticket for the\n activities  you like!",
  ),
];
