import 'package:egarage/repositery/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:egarage/screens/homePage.dart';
import 'package:egarage/screens/login.dart';
import 'package:egarage/screens/phoneauth.dart';
import 'package:egarage/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //var
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId = ''.obs;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null ? Get.offAll(Splash()) : Get.offAll(Homepage());
  }

  //fnc
  void phoneAuthentication(phoneNo) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);},
      codeSent: (verificationId, resendToken) {
        this.verificationId.value = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId.value = verificationId;
      },
      verificationFailed: (e) {
        if (e.code == 'invalide-phone-number') {
          Get.snackbar('error', 'Invalide phone number');
        } else {
          Get.snackbar('Error in number', 'try again');
        }
      },
    );
  }

  Future<bool> verifyOTP(String otp) async {
    var credentials = await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
            verificationId: verificationId.value, smsCode: otp));
    return credentials.user != null ? true : false;
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(phoneauth())
          : Get.offAll(phoneauth());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      if (e.code == 'invalid-email') {
        Get.snackbar('error', 'Invalid Email address');
      } else {
        Get.snackbar('Error in number', 'try again');
      }
      if (e.code == 'weak-password') {
        Get.snackbar('Weakpassword', 'Invalid Password');
      } else {
        Get.snackbar('Enter strong password', 'Eg-user2345');
      }
      print('FIREBASE AUTH EXCEPTION-${ex.message}');
      if (e.code == 'email-already-in-use') {
        Get.snackbar('Email exist', 'Try different Email address');
      } else {
        Get.snackbar('Email already exist', 'try again');
      }
      //
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION -${ex.message}');
      throw ex;
    }
  }

  // Future<void> loginUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _auth.signInWithEmailAndPassword(email: email, password: password);
  //   } on FirebaseAuthException catch (e) {
  //   } catch (_) {}
  // }

  Future<void> Logout() async => await _auth.signOut();
}
