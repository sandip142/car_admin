import 'package:another_dashed_container/another_dashed_container.dart';
import 'package:car_admin/user/Pages/BookingPage/BookingPage.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ParkingSlot extends StatelessWidget {
  final String parkingStatus;
  final String slotName;
  final String slotId;
  final String time;

  const ParkingSlot({
    super.key,
    this.slotName = "A-1",
    this.slotId = "0.0",
    this.time = "0",
    this.parkingStatus = "available",
  });

  @override
  Widget build(BuildContext context) {
    return DashedContainer(
      dashColor: Colors.blue.shade300,
      dashedLength: 10.0,
      blankLength: 9.0,
      strokeWidth: 1.0,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: 180,
        height: 120,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                time == ""
                    ? const SizedBox(width: 1)
                    : Container(
                        child: Text(time),
                      ),
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blue.shade100,
                      ),
                      borderRadius: BorderRadius.circular(20)),
                  child: Text(
                    slotName.toString(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Container(
                  child: const Text(""),
                )
              ],
            ),
            const SizedBox(height: 10),
            parkingStatus == "parked"
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "Assets/Photos/car.png",
                          width: 130,
                        )
                      ],
                    ),
                  )
                : parkingStatus == "booked"
                    ? Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "BOOKED",
                              style: TextStyle(
                                color: Colors.red.shade400,
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.to(BookingPage(
                                    slotId: slotId, slotName: slotName));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 7, horizontal: 30),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: const Text(
                                  "BOOK",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
          ],
        ),
      ),
    );
  }
}
