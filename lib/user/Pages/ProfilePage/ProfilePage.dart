
import 'package:car_admin/user/Controller/AuthController.dart';
import 'package:car_admin/user/Controller/ParkingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    ParkingController parkingController = Get.put(ParkingController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("ProfilePage"),
        actions: [
          IconButton(
            onPressed: () {
              parkingController.personalBooking();
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () {
              authController.signOut();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  Expanded(
                      child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Root User",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "${authController.auth.currentUser!.email}",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Text("Your Bookings",
                    style: Theme.of(context).textTheme.labelSmall),
              ],
            ),
            const SizedBox(height: 20),
            Obx(
              () => parkingController.isLoading.value
                  ? const LinearProgressIndicator()
                  : Column(
                      children: parkingController.yourBooking
                          .map(
                            (e) => Container(
                              margin: const EdgeInsets.only(bottom: 10),
                              padding: const EdgeInsets.all(15),
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Image.asset(
                                              "Assets/Photos/car.png",
                                              width: 150,
                                            ),
                                            const SizedBox(width: 20),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text("SLOT NO: ${e.slotNumber}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium),
                                                const SizedBox(height: 10),
                                                Text("${e.name}",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headlineMedium),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 20),
                                        Row(
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Booking Time",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall,
                                                ),
                                                Text(
                                                  "${e.parkingFromTime}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                                const SizedBox(height: 10),
                                                Text(
                                                  "Parking Time",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .labelSmall,
                                                ),
                                                Text(
                                                  "${e.parkingToTime}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .bodyMedium,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 30),
                                            Column(
                                              children: [
                                                const SizedBox(height: 20),
                                                const Text("Booking Amount"),
                                                Row(
                                                  children: [
                                                   Image.asset("Assets/Icons/currency.png",width: 40,),
                                                    Text(
                                                      "${e.totalAmount}",
                                                      style: const TextStyle(
                                                          fontSize: 40,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                        const SizedBox(height: 30),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            e.parkingStatus == "parked"
                                                ? ElevatedButton.icon(
                                                    onPressed: () {
                                                      parkingController
                                                          .checkout(
                                                              e.slotNumber!);
                                                    },
                                                    icon: const Icon(Icons.done),
                                                    label: const Text("Check Out"),
                                                  )
                                                : ElevatedButton.icon(
                                                    onPressed: () {
                                                      parkingController.cancleBooking(e.slotNumber!);
                                                    },
                                                    icon: const Icon(Icons.close),
                                                    label:
                                                        const Text("Cancel Booking"),
                                                  ),
                                            e.parkingStatus == "booked"
                                                ? ElevatedButton.icon(
                                                    onPressed: () {
                                                      parkingController.parked(
                                                          e.slotNumber!);
                                                    },
                                                    icon: const Icon(
                                                        Icons.local_parking),
                                                    label: const Text(
                                                        "Car Parked"),
                                                  )
                                                : const Text("Car parked"),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
