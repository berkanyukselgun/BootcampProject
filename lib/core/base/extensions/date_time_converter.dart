import 'package:intl/intl.dart';

extension DateConverter on String {
  String get formattedDate {
    DateTime _inputDate = DateTime.parse(this).toLocal();
    return DateFormat("d MMMM y", "tr_TR").format(_inputDate);
  }

  String get formattedTime {
    DateTime _inputDate = DateTime.parse(this).toLocal();
    return DateFormat.Hm("tr_TR").format(_inputDate);
  }

  String get formattedDay {
    DateTime _inputDate = DateTime.parse(this).toLocal();
    return DateFormat("d MMMM", "tr_TR").format(_inputDate);
  }
}
