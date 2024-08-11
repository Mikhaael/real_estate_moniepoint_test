import 'package:real_estate_moniepoint_test/core/api/exceptions/exceptions.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

extension DoubleExt on double {
  String get moneyFormat {
    return double.parse('$this').toStringAsFixed(2);
  }
}

extension IntExt on int {
  String get padded {
    if (this < 10) return "0$this";
    return "$this";
  }
}

extension StringExt on String {
  String get initial {
    return this[0];
  }

  String get initials {
    final words = split(" ").take(2);
    return words.map((word) => word[0]).join().toUpperCase();
  }

  String get moneyFormat {
    return double.parse(this).toStringAsFixed(2);
  }

  bool get isValidEmail {
    return RegExp(
            r"^[a-zA-Z\d.a-zA-Z!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z\d]+\.[a-zA-Z]+")
        .hasMatch(this);
  }

  /// If special char is required add (?=.*?[!@#&*~])
  bool get isValidPassword {
    if (isEmpty) return false;
    return RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?\d).{8,}$').hasMatch(this);
  }

  bool get isValidAccountNumber {
    if (isEmpty) return false;
    return double.tryParse(this) != null;
  }

  /// Encrypt String
  // String get encrypt {
  //   if (isEmpty) return "";
  //   final key = encrypt_key.Key.fromLength(32);
  //   final iv = encrypt_key.IV.fromLength(8);
  //   final encryptor = encrypt_key.Encrypter(encrypt_key.Salsa20(key));
  //   final encryptedStr = encryptor.encrypt(this, iv: iv);
  //   return encryptedStr.base64;
  // }

  /// Decrypt encrypted
  // String get decrypt {
  //   if (isEmpty) return "";
  //   final key = encrypt_key.Key.fromLength(32);
  //   final iv = encrypt_key.IV.fromLength(8);
  //   final encryptor = encrypt_key.Encrypter(encrypt_key.Salsa20(key));
  //   final decryptedStr =
  //       encryptor.decrypt(encrypt_key.Encrypted.from64(this), iv: iv);
  //   return decryptedStr;
  // }

  String get capitalize {
    if (length <= 1) return toUpperCase();
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String get paddedDigit {
    return double.parse(this) < 100 ? "0$this" : this;
  }
}

extension OptionalStringExt on String? {
  String get value {
    return this ?? "";
  }
}

extension StateExt on State {
  void waitAndExec(VoidCallback callback, {Duration? duration}) {
    Future.delayed(duration ?? const Duration(milliseconds: 800), callback);
  }
}

extension DioExceptionExt on DioException {
  String get errMessage {
    var errMsg = '';
    if (response?.data != null) {
      if (response?.data["message"] != null) {
        errMsg = response?.data["message"];
      } else if (response?.data["error"] != null) {
        errMsg = response?.data["error"];
      }
    } else if (this is ConnectionException) {
      errMsg = toString();
    } else {
      errMsg = response?.statusMessage.value ?? "";
    }

    return errMsg;
  }
}

/// [DateTime] extensions
extension DateExtensions on DateTime {
  ///
  /// [DateTime] Extension for formatting date as "Mon, 26 Oct 2022"
  String monthDate() {
    DateFormat formatter = DateFormat('MMMM yyyy');
    return formatter.format(this);
  }

  ///
  /// To noon of passed date
  DateTime toNoon() {
    return DateTime(year, month, day, 12, 0, 0);
  }

  /// Check if date is between two dates
  bool isBetween(DateTime d1, DateTime d2) {
    if (d1.isBefore(d2)) {
      return (isSameDay(d1) || isAfter(d1)) && (isSameDay(d2) || isBefore(d2));
    }
    return (isSameDay(d2) || isAfter(d2)) && (isSameDay(d1) || isBefore(d1));
  }

  ///
  /// [DateTime] Extension for formatting date as "Mon, 26 Oct 2022"
  String eventFullDate() {
    DateFormat formatter = DateFormat('EEE, d MMM yyyy');
    return formatter.format(this);
  }

  // ///
  // /// [DateTime] Extension for formatting date as "Mon, 26 Oct 2022"
  // String fullWordedDate() {
  //   return Jiffy.parseFromDateTime(this).format(pattern: 'EEEE, do MMMM yyyy');
  // }

  // ///
  // /// [DateTime] Extension for formatting date as "Mon, 26 Oct"
  // String eventHalfDate() {
  //   return Jiffy.parseFromDateTime(this).format(pattern: 'EEE, do MMM');
  // }

  ///
  /// [DateTime] Extension for formatting date as "Mon, 26 Oct"
  String cardDate() {
    DateFormat formatter = DateFormat('EEE, dd MMMM');
    return formatter.format(this);
  }

  ///
  /// [DateTime] Extension for formatting date as "Mon, 26 Oct"
  String formattedDate() {
    DateFormat formatter = DateFormat('dd MMM, yyyy');
    return formatter.format(this);
  }

  ///
  /// [DateTime] Extension for formatting date as "Monday, 26 Oct"
  String fullDateMinusYear() {
    DateFormat formatter = DateFormat('EEEE, d MMMM');
    return formatter.format(this);
  }

  ///
  /// [DateTime] Extension for formatting date as "26 October"
  String dayAndFullMonth() {
    DateFormat formatter = DateFormat('d MMMM');
    return formatter.format(this);
  }

  ///
  /// Checks if date is current day
  bool isCurrentDay() {
    final today = DateTime.now();
    return year == today.year && month == today.month && day == today.day;
  }

  ///
  /// Checks if the passed date is in the current week.
  bool dateIsInCurrentWeek() {
    DateTime now = DateTime.now();
    var firstDayOfWeek = now.subtract(Duration(days: now.weekday - 1));
    var lastDayOfWeek =
        now.add(Duration(days: DateTime.daysPerWeek - now.weekday));

    if (day == now.day ||
        day == firstDayOfWeek.day ||
        day == lastDayOfWeek.day ||
        (isAfter(firstDayOfWeek) && isBefore(lastDayOfWeek))) {
      return true;
    }
    return false;
  }

  ///
  /// Checks if date is same as passed date
  bool isSameDay(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }

  DateTime fromOffset(int hour) {
    return hour > 1
        ? add(Duration(hours: hour))
        : subtract(Duration(hours: hour.abs()));
  }

  ///
  /// Checks if date is same as passed date
  bool isBeforeToday() {
    final stringOther = DateFormat("yyyy-MM-dd").format(this);
    final stringToday = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final otherDate = DateTime.parse(stringOther);
    final todayDate = DateTime.parse(stringToday);

    return todayDate.difference(otherDate).inDays > 0;
  }

  ///
  /// Checks if date is same as passed date
  bool isAfterToday() {
    final stringOther = DateFormat("yyyy-MM-dd").format(this);
    final stringToday = DateFormat("yyyy-MM-dd").format(DateTime.now());
    final otherDate = DateTime.parse(stringOther);
    final todayDate = DateTime.parse(stringToday);

    return otherDate.difference(todayDate).inDays > 0;
  }

  ///
  /// Checks if the passed date is before current month.
  bool isBeforeCurrentMonth() {
    DateTime now = DateTime.now();
    DateTime earlier = now.subtract(Duration(days: now.day));
    return isBefore(earlier);
  }

  ///
  /// Returns Days in word from passed date
  List<String> getDaysInWordsForMonth() {
    var followingMonth = DateTime(year, month + 1, day);
    var numberOfDaysInMonth = followingMonth.difference(this).inDays;

    var dates = List.generate(
      numberOfDaysInMonth,
      (i) => DateFormat('E').format(DateTime(year, month, i + 1)),
    );

    return dates;
  }

  ///
  /// Returns Relative duration from current date.
  String timeago() {
    final dateYear = year;
    final dateMonth = month;
    final dateDay = day;
    final dateHour = hour;

    final currentDate = DateTime.now();
    final currentYear = currentDate.year;
    final currentMonth = currentDate.month;
    final currentDay = currentDate.day;
    final currentHour = currentDate.hour;

    String count = '';

    if (dateYear < currentYear) {
      count = currentYear - dateYear == 1
          ? "a year"
          : "${currentYear - dateYear} years";
    } else if (dateMonth < currentMonth) {
      count = currentMonth - dateMonth == 1
          ? "a month"
          : "${currentMonth - dateMonth} months";
    } else if (dateDay < currentDay) {
      count =
          currentDay - dateDay == 1 ? "a day" : "${currentDay - dateDay} days";
    } else if (dateHour < currentHour) {
      count = currentHour - dateHour == 1
          ? "an hour"
          : "${currentHour - dateHour} hours";
    } else {
      count = "a moment";
    }

    return "$count ago";
  }

  String pickerFormat() => DateFormat("MMMM dd, yyyy").format(this);

  DateTime ownDateTimeFromOffset(int coachOffset, int ownOffset) {
    final ownDateTimeToUtc = toUtc();
    DateTime toReturn;
    if (coachOffset < ownOffset) {
      toReturn = ownDateTimeToUtc.add(Duration(hours: ownOffset - coachOffset));
    } else {
      toReturn =
          ownDateTimeToUtc.subtract(Duration(hours: coachOffset - ownOffset));
    }
    return toReturn.toLocal();
  }

  DateTime dateTimeFromOffset(int offset) {
    final ownDateTimeToUtc = toUtc();
    if (offset < 0) {
      return ownDateTimeToUtc.subtract(Duration(hours: offset.abs()));
    }
    return ownDateTimeToUtc.add(Duration(hours: offset.abs()));
  }

  String get timezoneWithOffsets {
    final offset = timeZoneOffset.inHours;
    final zone = timeZoneName;
    return "$zone (GMT${offset < 0 ? offset : '+$offset'})";
  }

  String get time {
    DateFormat timeFormat = DateFormat("h:mm a");
    return timeFormat.format(this);
  }

  String get weekdayWord {
    switch (weekday) {
      case 1:
        return "Monday";
      case 2:
        return "Tuesday";
      case 3:
        return "Wednesday";
      case 4:
        return "Thursday";
      case 5:
        return "Friday";
      case 6:
        return "Saturday";
      case 7:
        return "Sunday";
      default:
        return "";
    }
  }

  int get daysInMonth {
    return DateTime(year, month + 1, 0).day;
  }

  DateTime copyTimeFromDate(DateTime otherDate) {
    return copyWith(
        hour: otherDate.hour,
        minute: otherDate.minute,
        second: otherDate.second);
  }
}
