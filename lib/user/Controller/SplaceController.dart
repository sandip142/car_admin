import 'package:car_admin/Admin/page/Authentication/Login_page.dart';
import 'package:car_admin/Admin/page/Home/home_page.dart';
import 'package:car_admin/selection_page.dart';
import 'package:car_admin/user/Controller/AuthController.dart';
import 'package:car_admin/user/Pages/Auth/LoginPage.dart';
import 'package:get/get.dart';

class SplaceController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    splaceHandle();
  }

  AuthController authController = Get.put(AuthController());
  Future<void> splaceHandle() async {
    await Future.delayed(const Duration(seconds: 3));
if (authController.auth.currentUser != null) {
                   Get.offAll(
                      const AdminHomePage(),
                    );
                  } else {
                    Get.offAll(
                      const AdminLoginPage(),
                    );
                  }
  }
}
