//import 'dart:html';
import 'package:cloud_firestore/cloud_firestore.dart';


class UserModel {
  final String? id;
  final String yourname;
  final String email;
  final String phoneNo;
  final String password;


  const UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.phoneNo,
    required this.yourname,


  });

  toJason() {
    return {
      "YourName": yourname,
      "Email": email,
      "Phone": phoneNo,
      "Password": password,
    };
  }

  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>>document){
    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["Email"],
      password: data["Password"],
      phoneNo: data["Phone"],
      yourname: data["YourName"],
    );
  }

}