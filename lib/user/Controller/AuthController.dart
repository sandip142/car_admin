
import 'package:car_admin/Admin/page/Authentication/Login_page.dart';
import 'package:car_admin/Admin/page/Home/home_page.dart';
import 'package:car_admin/user/Pages/Auth/LoginPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


import '../Pages/Home/HomePage.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isLogin = false.obs;
  RxBool isPwdHide = true.obs;
  final auth = FirebaseAuth.instance;
  TextEditingController loginEmail = TextEditingController();
  TextEditingController loginPwd = TextEditingController();
  TextEditingController signupEmail = TextEditingController();
  TextEditingController signupName = TextEditingController();
  TextEditingController signupPwd = TextEditingController();

  Future<void> loginWithEmailPassword() async {
    isLoading.value = true;
    try {
      await auth.signInWithEmailAndPassword(
          email: loginEmail.text, password: loginPwd.text);
      Get.offAll(
        const AdminHomePage(),
        transition: Transition.fadeIn,
      );
    } catch (e) {
      Fluttertoast.showToast(
          backgroundColor: Colors.red, msg: "Email or Password is wrong");
      // print(e);
    }
    isLoading.value = false;
  }

  Future<void> signUpWithEmailPassword() async {
    isLoading.value = true;
    try {
      await auth.createUserWithEmailAndPassword(
        email: signupEmail.text,
        password: signupPwd.text,
      );
      Get.offAll(
        const AdminHomePage(),
        transition: Transition.fadeIn,
      );
    } catch (e) {
      Fluttertoast.showToast(
          backgroundColor: Colors.red, msg: "Email or Password is wrong");
    }
    isLoading.value = false;
  }

  Future<void> signOut() async {
    auth.signOut();
    Get.off(const AdminLoginPage());
  }
}
