import 'package:egarage/models/user_model.dart';
import 'package:egarage/repositery/authentication_repository/authentication_repository.dart';
import 'package:egarage/repositery/authentication_repository/user_repository/user_repository.dart';
import 'package:egarage/screens/otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  static SignupController get instance =>Get.find();

  // TextField controllers

  final email =TextEditingController();
  final password =TextEditingController();
  final yourname =TextEditingController();
  final phoneNo =TextEditingController();
  @override
  void onInit() {
    // TODO: implement onInit
    phoneNo.text="+91";
    super.onInit();
  }
  final userRepo = Get.put(UserRepository());
  //call func from design
  void registerUser(String email, String password){
    String? error =AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password) as String?;
    if ( error != null){
      Get.showSnackbar(GetSnackBar(message: error.toString()));
    }
  }
 // get phone no user auth
void createUser(UserModel user) async{
  await userRepo.createUser(user);
  phoneAuthentication(user.phoneNo);
  Get.to(Otpscreen());
}
  void phoneAuthentication(phoneNo){
    AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }
}
