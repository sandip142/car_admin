
import 'package:car_admin/user/Controller/NotificationController.dart';
import 'package:car_admin/user/Models/ParkingModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Components/ConfirmPop.dart';

class ParkingController extends GetxController {
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  String parkingSlot0Id = "A-0";
  String parkingSlot1Id = "A-1";
  String parkingSlot2Id = "A-2";
  String parkingSlot3Id = "A-3";
  String parkingSlot4Id = "A-4";
  String parkingSlot5Id = "A-5";
  String parkingSlot6Id = "A-6";
  String parkingSlot7Id = "A-7";
  RxList<ParkingModel> parkingList = RxList<ParkingModel>();
  RxList<ParkingModel> yourBooking = RxList<ParkingModel>();
  RxBool isYourCarParked = false.obs;
  RxDouble time = 30.0.obs;
  RxDouble amount = 1.5.obs;
  RxBool isLoading = false.obs;
  Rx<ParkingModel> parkingSlot0 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot1 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot2 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot3 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot4 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot5 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot6 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot7 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot8 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot9 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot10 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot11 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot12 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot13 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot14 = ParkingModel().obs;
  Rx<ParkingModel> parkingSlot15 = ParkingModel().obs;
  NotificationControler notification = Get.put(NotificationControler());
  @override
  void onInit() async {
    // await dataInit();

    await dataInit();
    await getParkingInfo();
    super.onInit();
  }

  Future<void> dataInit() async {
    parkingList = RxList<ParkingModel>([
      ParkingModel(
        id: parkingSlot0Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-0",
      ),
      ParkingModel(
        id: parkingSlot1Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-1",
      ),
      ParkingModel(
        id: parkingSlot2Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-2",
      ),
      ParkingModel(
        id: parkingSlot3Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-3",
      ),
      ParkingModel(
        id: parkingSlot4Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-4",
      ),
      ParkingModel(
        id: parkingSlot5Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-5",
      ),
      ParkingModel(
        id: parkingSlot6Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-6",
      ),
      ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-7",
      ),
      ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-8",
      ),
      ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-9",
      ),
        ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-10",
      ),
        ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-11",
      ),
        ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-12",
      ),
        ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-13",
      ),
        ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-14",
      ),
      ParkingModel(
        id: parkingSlot7Id,
        name: "",
        status: "available",
        price: "0",
        parkingStatus: "available",
        slotNumber: "A-15",
      ),
    ]);
    for (var item in parkingList) {
      await db.collection("parking").doc(item.id).set(item.toJson());
    }
    print("Parking Slots Initialized");
  }

  Future<void> getParkingInfo() async {
    isLoading.value = true;
    parkingList.clear();
    await db.collection("parking").get().then((value) {
      for (var item in value.docs) {
        parkingList.add(ParkingModel.fromJson(item.data()));
      }
      isLoading.value = false;
    }, onError: (e) {
      print(e);
      isLoading.value = false;
    });
  }

  Future<void> bookSlot(
    String name,
    String vehicalNumber,
    String slotId,
    BuildContext context,
  ) async {
    try {
      await db.collection("parking").doc(slotId).update(
        {
          "id": slotId,
          "name": name,
          "slotNumber": slotId,
          "status": "booked",
          "parkingStatus": "booked",
          "vehicalNumber": vehicalNumber,
          "totalAmount": amount.value.toString(),
          "totalTime": time.value.toString(),
        },
      );
      await db
          .collection('users')
          .doc(auth.currentUser!.uid)
          .collection("parking")
          .doc(slotId)
          .set(
        {
          "name": name,
          "status": "booked",
          "parkingStatus": "booked",
          "vehicalNumber": vehicalNumber,
          "slotNumber": slotId,
          "id": slotId,
          "totalAmount": amount.value.toString(),
          "totalTime": time.value.toString(),
        },
      );
      await getParkingInfo();
      await notification.addNotification(
          "Slot no $slotId booked", "Booked", "You have booked a new slot ");
      BookedPopup(context, slotId, amount.value.toString(),
          time.value.toString(), name, vehicalNumber);
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  Future<void> personalBooking() async {
    isLoading.value = true;
    yourBooking.clear();
    await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection("parking")
        .get()
        .then((value) {
      for (var item in value.docs) {
        yourBooking.add(ParkingModel.fromJson(item.data()));
      }
    });
    isLoading.value = false;
  }

  Future<void> checkout(String slotId) async {
    isLoading.value = true;
    await db.collection("parking").doc(slotId).update(
      {
        "id": slotId,
        "name": "",
        "slotNumber": slotId,
        "parkingStatus": "available",
        "vehicalNumber": "",
        "totalAmount": "",
        "totalTime": "",
      },
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("parking")
        .doc(slotId)
        .delete();
    await personalBooking();
    await getParkingInfo();
    await notification.addNotification("Slot no $slotId checked out",
        "checkout", "You have checked out from your parking ");

    isLoading.value = false;
  }

  Future<void> parked(String slotId) async {
    isLoading.value = true;
    await db.collection("parking").doc(slotId).update(
      {
        "parkingStatus": "parked",
      },
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("parking")
        .doc(slotId)
        .update(
      {
        "parkingStatus": "parked",
      },
    );
    await personalBooking();
    await getParkingInfo();
    await notification.addNotification(
        "Slot no $slotId parked", "parked", "You have parked at your spot ");

    isLoading.value = false;
  }

  Future<void> cancleBooking(String slotId) async {
    isLoading.value = true;
    await db.collection("parking").doc(slotId).update(
      {
        "id": slotId,
        "name": "",
        "slotNumber": slotId,
        "parkingStatus": "available",
        "vehicalNumber": "",
        "totalAmount": "",
        "totalTime": "",
      },
    );
    await db
        .collection("users")
        .doc(auth.currentUser!.uid)
        .collection("parking")
        .doc(slotId)
        .delete();
    await personalBooking();
    await getParkingInfo();
    await notification.addNotification("Slot no $slotId cancelled booking",
        "cancel", "You have cancelled your booking ");

    isLoading.value = false;
  }

  Future<void> checkingCarisParkedOrNot() async {
    for (var car in yourBooking) {
      if (car.parkingStatus == "parked") {
        isYourCarParked.value = true;
        return;
      } else {
        isYourCarParked.value = false;
        return;
      }
    }
  }
}
