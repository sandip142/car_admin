import 'package:car_admin/user/Models/NotificationModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

class NotificationControler extends GetxController {
  final Uuid uuid = const Uuid();
  final db = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  RxBool isLoading = false.obs;
  RxList<NotificationModel> notificationList = RxList<NotificationModel>();


  @override
  void onInit() async{
  await  getNotification();
    super.onInit();
  }
  
  Future<void> addNotification(String title, String resone, String des) async {
    isLoading.value = true;
    var id = uuid.v4();
    var newNotification = NotificationModel(
      id: id,
      title: title,
      description: des,
      resone: resone,
    );
    await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection("notification")
        .doc(id)
        .set(newNotification.toJson());
    await getNotification();
        isLoading.value = false;
  }

  Future<void> getNotification() async {
    isLoading.value = true;
    notificationList.clear();
    await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection("notification")
        .get()
        .then((value) => {
              for (var item in value.docs)
                {notificationList.add(NotificationModel.fromJson(item.data()))}
            });
            isLoading.value = false;
  }

  Future<void> deleteNotification(String id) async{
     isLoading.value = true;
     await db
        .collection('users')
        .doc(auth.currentUser!.uid)
        .collection("notification")
        .doc(id).delete();
    getNotification();
    isLoading.value = false;
  }
}

