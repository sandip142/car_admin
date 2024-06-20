import 'dart:math';
import 'package:car_admin/Admin/page/Home/home_page.dart';
import 'package:car_admin/user/Controller/AuthController.dart';
import 'package:car_admin/user/Pages/Auth/LoginPage.dart';
import 'package:car_admin/user/Pages/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text(
          'Park Ease',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.grey.shade100,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Icon(
              Icons.car_rental,
              size: 200,
            ),
            const SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AdminHomePage()));
              },
              child: Container(
                height: 70,
                width: 250,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Colors.red,
                      Colors.blue,
                      Colors.green,
                    ],
                    transform: GradientRotation(pi / 4),
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Center(
                  child: Text(
                    "ADMIN",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 70,
              width: 250,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.red,
                    Colors.blue,
                    Colors.green,
                  ],
                  transform: GradientRotation(pi / 4),
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: GestureDetector(
                onTap: () {
                  if (authController.auth.currentUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  } else {
                    Get.offAll(
                      const LoginPage(),
                    );
                  }
                },
                child: const Center(
                  child: Text(
                    "USER",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
