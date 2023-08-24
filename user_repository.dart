import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:egarage/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
    await _db.collection('Users').add(user.toJason())
        .whenComplete(() {
      Get.snackbar("success", "Great!! Let's go",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.purple.withOpacity(0.2),
          colorText: Colors.redAccent);
    })
        .catchError((error, stackTrack) {
      Get.snackbar("Error", "Please check the details",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.3),
          colorText: Colors.red);
      print(error.toString());
    }
    );
  }
   Future<UserModel> getUserDetails(String email) async{
     final snapshot = await _db.collection("Users").where("Email",isEqualTo:email).get();
     final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
     return userData;
   }
  Future<List<UserModel>> allUser() async{
    final snapshot = await _db.collection("Users").get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).toList();
    return userData;
  }
}
