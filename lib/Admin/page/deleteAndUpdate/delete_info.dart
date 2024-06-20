import 'package:car_admin/Admin/conntroller/display_delete.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class DisplayPage extends StatelessWidget {
  final DisplayController _formDataController = Get.put(DisplayController());

  DisplayPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Data'),
      ),
      body: Obx(() {
        if (_formDataController.formList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: _formDataController.formList.length,
            itemBuilder: (context, index) {
              var formData = _formDataController.formList[index];
              String documentId = _formDataController.formList[index].id;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: ListTile(
                    title: Text("location: ${formData['location']}"),
                    subtitle: Text("Slots: ${formData['slots'].toString()}"),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _formDataController.deleteFormEntry(documentId);
                      },
                    ),
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
