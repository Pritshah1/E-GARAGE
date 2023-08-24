import 'package:egarage/repositery/authentication_repository/authentication_repository.dart';
import 'package:egarage/repositery/authentication_repository/user_repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:collection/collection.dart';


class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());
  getUserData(){
    final email = _authRepo.firebaseUser.value?.phoneNumber;
    if(email != null){
      return _userRepo.getUserDetails(email);
    }else{
      Get.snackbar("Error","Login to continue");
    }

  }

}