import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserSlotsController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  RxInt slots = RxInt(0);

  @override
  void onInit() {
    super.onInit();
    fetchUserSlots();
  }

  Future<void> fetchUserSlots() async {
    try {
      User? currentUser = _auth.currentUser;
      if (currentUser != null) {
        DocumentSnapshot userSnapshot = await _firestore.collection('parkdetail').doc(currentUser.uid).get();
        Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;
        if (userData != null) {
          slots.value = userData['slots'] ?? 0;
        }
      }
    } catch (e) {
      print('Error fetching user slots: $e');
    }
  }
}
