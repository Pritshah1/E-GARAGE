import 'package:egarage/controllers/signup_controller.dart';
import 'package:egarage/screens/otp.dart';
import 'package:egarage/wedigets/signup_form_widget.dart';
import 'package:flutter/material.dart';
import 'package:egarage/route/route.dart' as route;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:lottie/lottie.dart';
class SignupPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                  SizedBox(height: 20,),
                  // Image(
                  //   image: const AssetImage("assets/welcome.png"),
                  //   height: size.height * 0.2,
                  // ),
                  Lottie.asset("assets/splash2.json",
                    height: 180,
                    width: 800,
                    ),
                  //forms//
                   SignUpFormWidget(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("or"),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 40,
                        child: Container(
                          child: OutlinedButton.icon(
                              icon: const Image(
                                image: AssetImage("assets/google.png"),
                                width: 20.0,
                              ),
                              onPressed: () => Navigator.pushNamed(context, route.homepage),
                              label: Text("Sign in with google")),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2,
                  ),
                  TextButton(
                      onPressed: () => Navigator.pushNamed(context, route.loginPage),
                    child: Text.rich(TextSpan(
                      text: "Have an Account? ",
                      children: [
                        TextSpan(text: "Login",
                            style: TextStyle(color: Colors.white),
                        ),
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


