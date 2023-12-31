import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void showSnackBar(GlobalKey<ScaffoldState> globalKey, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(globalKey.currentContext as BuildContext).hideCurrentSnackBar();
  ScaffoldMessenger.of(globalKey.currentContext as BuildContext).showSnackBar(snackBar);
}

String compareAndCombineIds(String userID1, String userID2) {
  if (userID1.compareTo(userID2) < 0) {
    return userID2 + userID1;
  } else {
    return userID1 + userID2;
  }
}

String convertEpochMsToDateTime(int epochMs) {
  int oneDayInMs = 86400000;
  var date = DateTime.fromMillisecondsSinceEpoch(epochMs);
  int currentTimeMs = DateTime.now().millisecondsSinceEpoch;
  if ((currentTimeMs - epochMs) >= oneDayInMs) {
    return '${DateFormat.yMd().format(date)}  ${DateFormat.jm().format(date)}';
  } else {
    return DateFormat.jm().format(date);
  }
}

int calculateAge(DateTime birthDate) {
  final now = DateTime.now();
  int age = now.year - birthDate.year;
  if (now.month < birthDate.month ||
      (now.month == birthDate.month && now.day < birthDate.day)) {
    age--;
  }
  return age;
}

DateTime youngestBirthdayToSwipe(DateTime birthday) {
  // Calculate the youngest age based on the formula (birthday / 2 + 7)
  double youngestAge = calculateAge(birthday) / 2 + 7;
  print(youngestAge);

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the birth year based on the age
  num birthYear = currentDate.year - youngestAge;
  print(birthYear);

  // Construct and return the birthday
  DateTime youngestBirthday = DateTime(birthYear.toInt(), currentDate.month, currentDate.day);
  return youngestBirthday;
}

DateTime oldestBirthdayToSwipe(DateTime birthday) {
  // Calculate the youngest age based on the formula (birthday / 2 + 7)
  double oldestAge = (calculateAge(birthday) - 7) * 2;
  print(oldestAge);

  // Get the current date
  DateTime currentDate = DateTime.now();

  // Calculate the birth year based on the age
  num birthYear = currentDate.year - oldestAge;
  print(birthYear);

  // Construct and return the birthday
  DateTime oldestBirthday = DateTime(birthYear.toInt(), currentDate.month, currentDate.day);
  return oldestBirthday;
}
