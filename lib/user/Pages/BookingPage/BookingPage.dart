import 'package:car_admin/user/Controller/ParkingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class BookingPage extends StatelessWidget {
  final String slotName;
  final String slotId;
  const BookingPage({super.key, required this.slotId, required this.slotName});

  @override
  Widget build(BuildContext context) {
    ParkingController parkingController = Get.put(ParkingController());
    TextEditingController nameController = TextEditingController();
    TextEditingController vehicalNumberController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "BOOK SLOT",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    'Assets/animation/running_car.json',
                    width: 300,
                    height: 200,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Book Now 😊",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Divider(
                thickness: 1,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "Enter your name ",
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: nameController,
                      decoration: InputDecoration(
                        fillColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.person,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        hintText: " ",
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30),
              const Row(
                children: [
                  Text(
                    "Enter Vehical Number ",
                  )
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: vehicalNumberController,
                      decoration: InputDecoration(
                        fillColor:
                            Theme.of(context).colorScheme.primaryContainer,
                        filled: true,
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.car_rental,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        hintText: " ",
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Text(
                    "Choose Slot Time (in Minutes)",
                  )
                ],
              ),
              const SizedBox(height: 10),
              Obx(
                () => Slider(
                  mouseCursor: MouseCursor.defer,
                  thumbColor: Theme.of(context).colorScheme.primary,
                  activeColor: Theme.of(context).colorScheme.primary,
                  inactiveColor: Theme.of(context).colorScheme.background,
                  label: "${parkingController.time.value} m",
                  value: parkingController.time.value,
                  onChanged: (v) {
                    parkingController.time.value = v;
                    parkingController.amount.value = v * .05;
                  },
                  divisions: 6,
                  min: 30,
                  max: 210,
                ),
              ),
              const Padding(
                padding: const EdgeInsets.only(left: 10, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("30"),
                    Text("60"),
                    Text("90"),
                    Text("120"),
                    Text("150"),
                    Text("180"),
                    Text("210"),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Your Slot Name",
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 100,
                    height: 80,
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        slotName,
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 80),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      const Row(
                        children: [
                          Text("Amount to Be Pay"),
                        ],
                      ),
                      Row(
                        children: [
                          Image.asset(
                            "Assets/Icons/currency.png",
                            width: 40,
                          ),
                          Obx(
                            () => Text(
                              "${parkingController.amount.value.toStringAsFixed(2)}",
                              style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      // BookedPopup(context);

                      parkingController.bookSlot(nameController.text,
                          vehicalNumberController.text, slotId, context);
                    },
                    child: Container(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Text(
                        "PAY NOW",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
