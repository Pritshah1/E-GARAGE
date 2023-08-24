import 'package:egarage/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:egarage/route/route.dart' as route;
import 'package:lottie/lottie.dart';

class Otpscreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    var otpController = Get.put(OTPController());
    var otp;
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyanAccent,
        body: SingleChildScrollView(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 110,),
                  Text("CO",style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 80.0,
                  )),
                  Text("DE",style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 80.0,
                  )),
                  Text("VERIFICATION", style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                  ),
                  SizedBox(height: 20,),
                  OtpTextField(
                    numberOfFields: 6,
                    fillColor: Colors.orangeAccent,
                    filled: true,
                    onSubmit:(code) {
                      otp =code;
                     OTPController.instance.verifyOTP(otp);
                    },
                  ),
                  SizedBox(height: 24),
                  SizedBox(width: 298,height: 40,
                    child: ElevatedButton(onPressed:(){
                      OTPController.instance.verifyOTP(otp);
                    },
                        child: Text("Next"),),
                  ),
                  // Lottie.asset("assets/splash3.json",
                  //   height: 180,
                  //   width: 800,
                  // ),

                  Lottie.asset("assets/splash3.json",
                    height: 280,
                    width: 300,
                  ),

                ],

              ),
            ),

          ),
        ),
      ),
    );
  }
}
