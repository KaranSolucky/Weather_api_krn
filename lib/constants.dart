import 'dart:core';
import 'package:intl/intl.dart';

import 'model/five_day_model.dart/five_day_model.dart';

FiveDayModel? weather;
List fiveDaysFromNow = [
  'Today',
  DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 1))),
  DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 2))),
  DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 3))),
  DateFormat('EEEE').format(DateTime.now().add(const Duration(days: 4)))
];
List next3Hours = [
  'Now',
  DateFormat().add_jm().format(DateTime.now().add(const Duration(hours: 3))),
  DateFormat().add_jm().format(DateTime.now().add(const Duration(hours: 6))),
  DateFormat().add_jm().format(DateTime.now().add(const Duration(hours: 9))),
  DateFormat().add_jm().format(DateTime.now().add(const Duration(hours: 12))),
  DateFormat().add_jm().format(DateTime.now().add(const Duration(hours: 15))),
  DateFormat().add_jm().format(DateTime.now().add(const Duration(hours: 18))),
  DateFormat().add_jm().format(DateTime.now().add(const Duration(hours: 21))),
  DateFormat().add_jm().format(DateTime.now().add(const Duration(hours: 24))),
];
