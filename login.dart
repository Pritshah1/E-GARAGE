import 'package:egarage/controllers/signup_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:egarage/route/route.dart' as route;
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:lottie/lottie.dart';

import '../models/user_model.dart';
class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static Future<User?>loginUsingEmailPassword({required String email,required String password,required BuildContext context})async{
    FirebaseAuth auth =FirebaseAuth.instance;
    User? user;
    try{
      UserCredential userCredential=await auth.signInWithEmailAndPassword(email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e){
      if(e.code =="user not found"){
        Get.snackbar('error', 'Enter valid user');
      } else {
        Get.snackbar('Email not found', 'Try again');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    final controller = Get.put(SignupController());
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
                  SizedBox(height: 40,),
                  // Image(
                  //   image: AssetImage("assets/welcome.png"),
                  //   height: size.height * 0.2,
                  // ),
                  Lottie.asset("assets/splash6.json",
                    height: 180,
                    width: 800,
                  ),
                  //forms//
                  Form(
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: _emailController,
                              decoration: InputDecoration(
                                prefixIcon:
                                    Icon(Icons.person_add_alt_1_outlined),
                                labelText: "E-mail",
                                hintText: "Enter your email address",
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.password),
                                labelText: "Password",
                                hintText: "Enter your password",
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.remove_red_eye_outlined),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            SizedBox(height: 20,),
                            Container(
                              child: SizedBox(
                                width: double.infinity,
                                height: 40,
                                child: ElevatedButton(
                                  onPressed: () async{
                                    User?user =await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                                    print(user);
                                    if(user !=null){
                                      Navigator.pushNamed(context, route.homepage);
                                    }
                                  },
                                  child: Container(child: Text("Login")),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("or"),
                      SizedBox(
                        height: 20,
                      ),
                      // Form(
                      //   key: formKey,
                      //   child: Column(
                      //     children: [
                      //       TextFormField(
                      //         keyboardType: TextInputType.phone,
                      //         controller: controller.phoneNo,
                      //         decoration: InputDecoration(
                      //             prefixIcon: Icon(
                      //               Icons.numbers,
                      //               color: Colors.black,
                      //             ),
                      //             labelText: "Phone Authentication",
                      //             hintText: "Enter your 10 digit phone number",
                      //             labelStyle: TextStyle(color: Colors.black),
                      //             border: OutlineInputBorder(),
                      //             focusedBorder: OutlineInputBorder(
                      //                 borderSide:
                      //                 BorderSide(width: 2.0, color: Colors.orange))),
                      //
                      //       ),
                      //       SizedBox(height: 10,),
                      //       Container(
                      //         child: SizedBox(
                      //           width: double.infinity,
                      //           height: 40,
                      //           child: ElevatedButton(
                      //
                      //             onPressed: () {
                      //               if (formKey.currentState!.validate()) {
                      //                 // SignupController.instance.registerUser(
                      //                 // controller.email.text.trim(),
                      //                 // controller.password.text.trim());
                      //                 // SignupController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                      //                 final user  = UserModel(
                      //                   yourname: controller.yourname.text.trim(),
                      //                   phoneNo: controller.phoneNo.text.trim(),
                      //                   email: controller.email.text.trim(),
                      //                   password: controller.password.text.trim(),
                      //                 );
                      //                 // SignupController.instance.registerUser(AutofillHints.email,AutofillHints.password);
                      //                 SignupController.instance.createUser(user);
                      //               }
                      //             },
                      //             child: Container(child: Text("Verify")),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, route.signupPage),
                      child: Text.rich(TextSpan(
                          text: "Don't have an Account?  ",
                        children: [
                          TextSpan(text: "Signup",
                              style: TextStyle(color: Colors.white) ),
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
