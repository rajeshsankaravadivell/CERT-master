
import 'package:get/get.dart';
import 'package:pert/models/usermodel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  final UserModel user;
  static UserController instance = Get.find();
  UserController(this.user);
}

class DepartmentController extends GetxController {
  final List<String> departments;
  static DepartmentController instance = Get.find();
  DepartmentController(this.departments);
}

class PreferencesController extends GetxController {
  final SharedPreferences preferences;
  static PreferencesController instance = Get.find();
  PreferencesController(this.preferences);
}