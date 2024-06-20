import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisplayController extends GetxController {
  RxList<DocumentSnapshot> formList = <DocumentSnapshot>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFormData();
  }

  Future<void> fetchFormData() async {
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('parkdetail').get();
      formList.assignAll(querySnapshot.docs);
    } catch (e) {
      print('Error fetching form data: $e');
    }
  }

  Future<void> deleteFormEntry(String documentId) async {
    try {
      await FirebaseFirestore.instance.collection('parkdetail').doc(documentId).delete();
      formList.removeWhere((doc) => doc.id == documentId);
      Get.snackbar('Success', 'Form entry deleted successfully');
    } catch (e) {
      print('Error deleting form entry: $e');
      Get.snackbar('Error', 'Failed to delete form entry');
    }
  }
}
