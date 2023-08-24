// ignore_for_file: depend_on_referenced_packages

import 'package:intl/intl.dart';

String formatDateString2(String dateString) {
  DateTime date = DateTime.parse(dateString);
  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
  return formattedDate;
}