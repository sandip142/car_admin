import 'package:car_admin/user/Controller/ParkingController.dart';
import 'package:car_admin/user/Pages/PakingSlotPage/Widgets/ParkingSlot.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SlotsCountPage extends StatelessWidget {
  final String location;
  final int totalSlots;

   SlotsCountPage(
      {super.key, required this.location, required this.totalSlots});
    ParkingController parkingController = Get.put(ParkingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Slots Count'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Location: $location',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 20),
          Text(
            'Total Slots: $totalSlots',
            style: const TextStyle(fontSize: 20),
          ),
          Expanded(
            child: GridView.builder(
                
                itemCount: totalSlots,
                itemBuilder: (context, index) {
                 
                 return Container(
                      child: 
                            Obx(
                              () => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Expanded(
                                  child: ParkingSlot(
                                    parkingStatus: parkingController
                                        .parkingList[index].parkingStatus!,
                                    slotName: parkingController
                                        .parkingList[index].slotNumber!,
                                    slotId: parkingController.parkingList[index].id!,
                                    time: parkingController
                                            .parkingList[index].totalRemainingTime ??
                                        "",
                                  ),
                                ),
                              ),
                            ),
                 );
                           
                }, gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),),
          )
        ],
      ),
    );
  }
}
