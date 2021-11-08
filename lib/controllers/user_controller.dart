import 'package:pert/models/admin.dart';
import 'package:get/get.dart';
import 'package:pert/models/usermodel.dart';

class UserController extends GetxController {
  final UserModel user;
  static UserController instance = Get.find();
  UserController(this.user);
}
