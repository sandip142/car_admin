import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FormController extends GetxController {
  RxList formList = [].obs;
  RxList filteredForms = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFormData();
  }

  Future<void> fetchFormData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('parkdetail').get();
      formList.assignAll(querySnapshot.docs);
      filteredForms.assignAll(formList);
    } catch (e) {
      print('Error fetching form data: $e');
    }
  }

  void filterForms(String location) {
    if (location.isEmpty) {
      filteredForms.assignAll(formList);
    } else {
      filteredForms.assignAll(formList.where((formData) => formData.data()['location'].toLowerCase().contains(location.toLowerCase())));
    }
  }

int getTotalSlots(String location) {
  return formList.fold(0, (total, formData) {
    var slots = formData.data()['slots'] as int?;
    if (slots != null && formData.data()['location'] == location) {
      total += slots;
    }
    return total;
  });
}
}