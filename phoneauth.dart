import 'package:egarage/controllers/signup_controller.dart';
import 'package:egarage/screens/otp.dart';
import 'package:egarage/wedigets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:egarage/route/route.dart' as route;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';

import '../models/user_model.dart';

class phoneauth extends StatefulWidget {
  const phoneauth({Key? key}) : super(key: key);

  @override
  State<phoneauth> createState() => _phoneauthState();
}

class _phoneauthState extends State<phoneauth> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final size = MediaQuery
        .of(context)
        .size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.purple,
      ),
      home: Scaffold(
        backgroundColor: Colors.cyan,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 40,),
                  // Image(
                  //   image: AssetImage("assets/welcome.png"),
                  //   height: size.height * 0.2,
                  // ),
                  Lottie.asset("assets/splash7.json",
                    height: 230,
                    width: 800,
                  ),
                  //forms//
                  SizedBox(height: 30,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text("OR",style: TextStyle(fontSize: 25,)),
                      ),

                      SizedBox(height: 30,),
                      Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              keyboardType: TextInputType.phone,
                              controller: controller.phoneNo,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.numbers,
                                    color: Colors.black,
                                  ),
                                  labelText: "Phone Authentication",
                                  hintText: "Enter your 10 digit phone number",
                                  labelStyle: TextStyle(color: Colors.black),
                                  border: OutlineInputBorder(),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(
                                          width: 2.0, color: Colors.orange))),

                            ),
                            SizedBox(height: 10,),
                            Container(
                              child: SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(

                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      // SignupController.instance.registerUser(
                                      // controller.email.text.trim(),
                                      // controller.password.text.trim());
                                      // SignupController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                                      final user = UserModel(
                                        yourname: controller.yourname.text
                                            .trim(),
                                        phoneNo: controller.phoneNo.text.trim(),
                                        email: controller.email.text.trim(),
                                        password: controller.password.text
                                            .trim(),
                                      );
                                      // SignupController.instance.registerUser(AutofillHints.email,AutofillHints.password);
                                      SignupController.instance.createUser(
                                          user);
                                    }
                                  },
                                  child: Container(child: Text("Verify")),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, route.signupPage),
                    child: Text.rich(TextSpan(
                      text: "Don't have an Account?  ",
                      children: [
                        TextSpan(text: "Signup",
                            style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    ),
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