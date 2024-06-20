
import 'package:car_admin/Admin/AddYours/add_yours.dart';
import 'package:car_admin/Admin/page/deleteAndUpdate/delete_info.dart';
import 'package:car_admin/Admin/page/parkingSpots/parking_spots.dart';
import 'package:car_admin/user/Controller/AuthController.dart';
import 'package:car_admin/user/Controller/ParkingController.dart';
import 'package:car_admin/user/Controller/ThemeController.dart';
import 'package:car_admin/user/Pages/CCTVPage/CctvPage.dart';
import 'package:car_admin/user/Pages/ProfilePage/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
ThemeController themeController = Get.put(ThemeController());
    ParkingController parkingController = Get.put(ParkingController());
    AuthController authController = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "DASHBOARD",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          Obx(
            () => IconButton(
              onPressed: () {
                themeController.changeTheme();
              },
              icon: themeController.isDark.value
                  ? const Icon(
                      Icons.wb_sunny,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.nightlight_round,
                      color: Colors.white,
                    ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            // SvgPicture.asset(
            //   "Assets/Icons/logo.svg",
            //   color: Theme.of(context).colorScheme.onBackground,
            // ),
            Lottie.asset(
              'Assets/animation/running_car.json',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PARK EASY",
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Text(
              "Welcome to Car Parking System you can book your parking slot from any where with you phone",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelSmall,
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                
                Get.to(const AddYours());
                 
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.car_rental,
                      size: 40,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      "ADD YOUR Details",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () async {
                await parkingController.personalBooking();
                // Get.to(ProfilePage());
                await parkingController.checkingCarisParkedOrNot();
                parkingController.isYourCarParked.value
                    ? Get.to(const CctvPage())
                    : Get.snackbar(
                        "Unparked Vehicle ", "Please park your vehicle first");
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.videocam_rounded,
                      size: 40,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      "View CCTV Footage",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                parkingController.personalBooking();
                Get.to(const ProfilePage());
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 40,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      "Profile Page",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () {
                Get.to(const ViewParkingAvailablities());
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.notifications,
                      size: 40,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      "Your slots",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            InkWell(
              onTap: () async{
               await Get.to(DisplayPage());
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(
                      Icons.display_settings,
                      size: 40,
                    ),
                    const SizedBox(width: 30),
                    Text(
                      "dispaly detail",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      authController.signOut();
                    },
                    icon: const Icon(Icons.logout),
                    label: const Text("Logout"),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}