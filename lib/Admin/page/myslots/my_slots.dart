import 'package:car_admin/Admin/conntroller/slots_detail.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UserSlotsPage extends StatefulWidget {
  const UserSlotsPage({super.key});

  @override
  State<UserSlotsPage> createState() => _UserSlotsPageState();
}

class _UserSlotsPageState extends State<UserSlotsPage> {
  final UserSlotsController _controller = Get.put(UserSlotsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Slots'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  'User Slots: ${_controller.slots.value}',
                  style: TextStyle(fontSize: 20),
                )),
          ],
        ),
      ),
    );
  }
}
