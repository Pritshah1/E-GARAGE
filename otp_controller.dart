import 'package:egarage/repositery/authentication_repository/authentication_repository.dart';
import 'package:egarage/screens/homePage.dart';
import 'package:get/get.dart';

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async{
    var isVerified = await AuthenticationRepository.instance.verifyOTP(otp);
    isVerified ? Get.offAll(Homepage()) : Get.back();
  }
}
