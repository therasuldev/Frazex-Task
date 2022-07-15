import 'package:frazex_task/core/service/service.dart';
import 'package:hive_flutter/hive_flutter.dart';

class PrefService extends SuperService {
  static Box get preferences => Hive.box('preferences');

  //
  static bool get isPreferencesSetted => preferences.isNotEmpty;
}
