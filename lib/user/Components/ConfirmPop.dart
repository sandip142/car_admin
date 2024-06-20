
import 'package:car_admin/user/Pages/Home/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

Future<dynamic> BookedPopup(BuildContext context, String slotId, String amount,
    String time, String name, String vehicalNumber) {
  return Get.defaultDialog(
    barrierDismissible: false,
    title: "SLOT BOOKED",
    titleStyle: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Theme.of(context).colorScheme.primary,
    ),
    content: Column(
      children: [
        Lottie.asset(
          'Assets/animation/done1.json',
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Slot Booked",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.primary,
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 5),
            Text(
              "Name : $name",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.car_rental),
            const SizedBox(width: 5),
            Text(
              "Vehical No  : $vehicalNumber ",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.watch_later_outlined),
            const SizedBox(width: 5),
            Text(
              "Time : $time",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.solar_power_outlined),
            const SizedBox(width: 5),
            Text(
              "Parking Slot : $slotId",
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "Assets/Icons/currency.png",
              width: 20,
            ),
            Text(
              " $amount",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Get.offAll(const HomePage());
          },
          child: const Text("Close"),
        )
      ],
    ),
  );
}
