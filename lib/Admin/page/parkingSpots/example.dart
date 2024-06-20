import 'package:car_admin/Admin/conntroller/form_detail.dart';
import 'package:car_admin/Admin/page/parkingSpots/slot_count_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class FormDataPage extends StatefulWidget {
  const FormDataPage({super.key});
  @override
  State<FormDataPage> createState() => _FormDataPageState();
}

class _FormDataPageState extends State<FormDataPage> {
  final FormController _formController = Get.put(FormController());

  final TextEditingController _searchController = TextEditingController();

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Data'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by Location',
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
              ),
              onChanged: (value) {
                _formController.filterForms(value);
              },
            ),
          ),
          Expanded(child: _buildFormList(context)),
        ],
      ),
    );
  }

  Widget _buildFormList(BuildContext context) {
    return Obx(() {
      var filteredForms = _formController.filteredForms;
      return ListView.builder(
        itemCount: filteredForms.length,
        itemBuilder: (context, index) {
          var formData = filteredForms[index].data();
          return ListTile(
            title: Text(formData['location']),
            onTap: () {
              String location = formData['location'];
              int totalSlots = _formController.getTotalSlots(location);
              Get.to(SlotsCountPage(location: location, totalSlots: totalSlots));
            },
          );
        },
      );
    });
  }
}