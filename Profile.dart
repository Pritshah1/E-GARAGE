import 'package:egarage/controllers/profile_controller.dart';
import 'package:egarage/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:collection/collection.dart';

class profile extends StatefulWidget {
   profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override

  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed:() => Get.back(),icon: Icon(Icons.arrow_back)),
        title: Text("Profile Detailes",style: TextStyle(fontSize: 12),),
      ),
      body: SingleChildScrollView(
            child: Container(
              child: FutureBuilder(
                future: controller.getUserData(),
                builder: (context,snapshot){
                  if(snapshot.connectionState == ConnectionState.done){
                    if(snapshot.hasData){
                      UserModel userData = snapshot.data as UserModel;
                      return Column(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(48.0),
                              child: Stack(
                                children: [
                                  SizedBox(width: 120,
                                    height: 200,
                                    child: CircleAvatar(child: ClipOval(
                                      child: Image.asset("assets/profile.png",
                                        fit: BoxFit.cover,),
                                    )),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Form(
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    initialValue :userData.yourname,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                      Icon(Icons.person_add_alt_1_outlined),
                                      label: Text("YourName"),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextFormField(
                                    initialValue :userData.email,
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(Icons.email_outlined),
                                      label :Text("Email"),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  TextFormField(
                                    initialValue :userData.phoneNo,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                      Icon(Icons.phone),
                                      label: Text("Phone"),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  TextFormField(
                                    initialValue :userData.password,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                      Icon(Icons.password),
                                      label: Text("Password"),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),

                                  SizedBox(height: 20,),

                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    } else if(snapshot.hasError){
                      return Center(child: Text(snapshot.error.toString()));
                    } else {
                      return Center(child: Text("something went wrong"));
                    }
                  }else{
                   return Center(child: CircularProgressIndicator());
                  }
                }
              ),
            ),
      ),
    );
  }
}
