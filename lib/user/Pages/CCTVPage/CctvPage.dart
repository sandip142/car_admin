
import 'package:car_admin/user/Controller/CctvController.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CctvPage extends StatelessWidget {
  const CctvPage({super.key});

  @override
  Widget build(BuildContext context) {
    CctvController cctvController = Get.put(CctvController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("CCTV Footage"),
      ),
      body: Column(
        children: [
       
        Container(
          height: 749,
          width: MediaQuery.of(context).size.width,
          child: RotatedBox(
            quarterTurns: 1,
            child: AspectRatio(
              aspectRatio: 16/9,
              child: Chewie(controller: cctvController.chewieController)),
          ),
        ),
        ],
      ),
    );
  }
}
