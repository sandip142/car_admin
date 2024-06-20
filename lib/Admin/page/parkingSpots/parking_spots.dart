
import 'package:car_admin/ConstData.dart';
import 'package:car_admin/user/Controller/ParkingController.dart';
import 'package:car_admin/user/Pages/PakingSlotPage/Widgets/ParkingSlot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewParkingAvailablities extends StatelessWidget {
  const ViewParkingAvailablities({super.key});

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "PARKING SLOTS",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Obx(
            () => parkingController.isLoading.value
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(
                    children: [
                      const SizedBox(height: 50),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("ENTRY"),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Obx(
                            () => Expanded(
                              child: ParkingSlot(
                                parkingStatus: parkingController
                                    .parkingList[0].parkingStatus!,
                                slotName: parkingController
                                    .parkingList[0].slotNumber!,
                                slotId: parkingController.parkingList[0].id!,
                                time: parkingController
                                        .parkingList[0].totalRemainingTime ??
                                    "",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: VerticalDivider(
                              color: Theme.of(context).colorScheme.primary,
                              thickness: 1,
                            ),
                          ),
                          Expanded(
                            child: ParkingSlot(
                              parkingStatus: parkingController
                                  .parkingList[1].parkingStatus!,
                              slotName:
                                  parkingController.parkingList[1].slotNumber!,
                              slotId: parkingController.parkingList[1].id!,
                              time: parkingController
                                      .parkingList[1].totalRemainingTime ??
                                  "",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ParkingSlot(
                              parkingStatus: parkingController
                                  .parkingList[2].parkingStatus!,
                              slotName:
                                  parkingController.parkingList[2].slotNumber!,
                              slotId: parkingController.parkingList[2].id!,
                              time: parkingController
                                      .parkingList[2].totalRemainingTime ??
                                  "",
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: VerticalDivider(
                              color: Theme.of(context).colorScheme.primary,
                              thickness: 1,
                            ),
                          ),
                          Expanded(
                            child: ParkingSlot(
                              parkingStatus: parkingController
                                  .parkingList[3].parkingStatus!,
                              slotName:
                                  parkingController.parkingList[3].slotNumber!,
                              slotId: parkingController.parkingList[3].id!,
                              time: parkingController
                                      .parkingList[3].totalRemainingTime ??
                                  "",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ParkingSlot(
                              parkingStatus: parkingController
                                  .parkingList[4].parkingStatus!,
                              slotName:
                                  parkingController.parkingList[4].slotNumber!,
                              slotId: parkingController.parkingList[4].id!,
                              time: parkingController
                                      .parkingList[4].totalRemainingTime ??
                                  "",
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: VerticalDivider(
                              color: Theme.of(context).colorScheme.primary,
                              thickness: 1,
                            ),
                          ),
                          Expanded(
                            child: ParkingSlot(
                              parkingStatus: parkingController
                                  .parkingList[5].parkingStatus!,
                              slotName:
                                  parkingController.parkingList[5].slotNumber!,
                              slotId: parkingController.parkingList[5].id!,
                              time: parkingController
                                      .parkingList[5].totalRemainingTime ??
                                  "",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            child: ParkingSlot(
                              parkingStatus: parkingController
                                  .parkingList[6].parkingStatus!,
                              slotName:
                                  parkingController.parkingList[6].slotNumber!,
                              slotId: parkingController.parkingList[6].id!,
                              time: parkingController
                                      .parkingList[6].totalRemainingTime ??
                                  "",
                            ),
                          ),
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: VerticalDivider(
                              color: Theme.of(context).colorScheme.primary,
                              thickness: 1,
                            ),
                          ),
                          Expanded(
                            child: ParkingSlot(
                              parkingStatus: parkingController
                                  .parkingList[7].parkingStatus!,
                              slotName:
                                  parkingController.parkingList[7].slotNumber!,
                              slotId: parkingController.parkingList[7].id!,
                              time: parkingController
                                      .parkingList[7].totalRemainingTime ??
                                  "",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("EXIT"),
                              Icon(Icons.keyboard_arrow_down)
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Made By ❤️ : $LeaderName",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
          )),
    );
  }
}
