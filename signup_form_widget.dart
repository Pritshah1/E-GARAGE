import 'package:egarage/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controllers/signup_controller.dart';
import 'package:egarage/repositery/authentication_repository/exceptions/signup_email_password_failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpFormWidget extends StatefulWidget {
  // final formKey = GlobalKey<FormState>();

  @override
  State<SignUpFormWidget> createState() => _SignUpFormWidgetState();
}

class _SignUpFormWidgetState extends State<SignUpFormWidget> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Container(
      child: Column(
        children: [
          Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    controller: controller.yourname,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.person_outline_sharp,
                          color: Colors.black,
                        ),
                        labelText: "Your name",
                        hintText: "Name Surname",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.orange))),
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.phone,
                        controller: controller.phoneNo,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.numbers,
                              color: Colors.black,
                            ),
                            labelText: "Phone number",
                            hintText: "Enter your 10 digit phone number",
                            labelStyle: TextStyle(color: Colors.black),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(width: 2.0, color: Colors.orange))),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: controller.email,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.black,
                        ),
                        labelText: "E-mail",
                        hintText: "Enter your email address",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.orange))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  TextFormField(
                    controller: controller.password,
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.password,
                          color: Colors.black,
                        ),
                        labelText: "Password",
                        hintText: "Enter your Password",
                        labelStyle: TextStyle(color: Colors.black),
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 2.0, color: Colors.orange))),
                  ),
                  SizedBox(
                    height: 1,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {}, child: Text("Forgot password?")),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Container(
                    child: SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                             SignupController.instance.registerUser(
                                controller.email.text.trim(),
                                controller.password.text.trim());
                              SignupController.instance.phoneAuthentication(controller.phoneNo.text.trim());
                            final user  = UserModel(
                              yourname: controller.yourname.text.trim(),
                              phoneNo: controller.phoneNo.text.trim(),
                                email: controller.email.text.trim(),
                                password: controller.password.text.trim(),
                            );
                            // SignupController.instance.registerUser(AutofillHints.email,AutofillHints.password);
                            SignupController.instance.createUser(user);
                          }
                        },
                        child: Container(child: Text("Signup")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
