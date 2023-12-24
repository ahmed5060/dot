// ignore_for_file: depend_on_referenced_packages

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:intl/intl.dart';

String formatDateString2(String dateString) {
  DateTime date = DateTime.parse(dateString);
  String formattedDate = DateFormat('dd-MM-yyyy').format(date);
  return formattedDate;
}

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log("Handling a background message: ${message.toMap()}");
}