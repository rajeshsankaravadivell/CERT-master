import 'package:get/state_manager.dart';
import 'package:get/get.dart';
import 'package:pert/services/auth.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  var auth = AuthenticationService();
}
