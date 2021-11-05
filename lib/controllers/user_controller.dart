import 'package:pert/models/admin.dart';
import 'package:get/get.dart';

class UserController extends GetxController {
  final Admin admin;
  static UserController instance = Get.find();
  UserController(this.admin);
}
