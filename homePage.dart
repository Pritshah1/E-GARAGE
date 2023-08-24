import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:egarage/repositery/authentication_repository/authentication_repository.dart';
import 'package:egarage/screens/EV.dart';
import 'package:flutter/material.dart';
import 'package:egarage/route/route.dart' as route;
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../controllers/signup_controller.dart';
import '../route/route.dart';
import 'package:maps_launcher/maps_launcher.dart';

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List imageList = [
    {"id": 1, "image_path": 'assets/img5.jpeg'},
    {"id": 2, "image_path": 'assets/img6.jpeg'},
    {"id": 3, "image_path": 'assets/img7.jpg'},
    {"id": 4, "image_path": 'assets/img8.jpg'}
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
        primarySwatch: Colors.blue,
        ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.cyan,
        appBar: AppBar(
          title: Container(
            margin: EdgeInsets.only(top: 5,),
              padding:EdgeInsets.only(left: 150),
            child: Column(
              children: [
                Text("Gujarat,",),
                Text("Ahmedabad"),
              ],
            ),
          ),
        ),
           bottomNavigationBar: BottomAppBar(
             color: Colors.lightBlue,
             shape: CircularNotchedRectangle(),
           child: new Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: <Widget>[

             Expanded(child: IconButton(icon: Icon(Icons.supervised_user_circle_rounded),
               onPressed: () => Navigator.pushNamed(context, route.Profile),),),
             Expanded(child: IconButton(icon: Icon(Icons.home),
               onPressed: () => Navigator.pushNamed(context, route.homepage),),),
             Expanded(child: IconButton(icon: Icon(Icons.person),
               onPressed: () => Navigator.pushNamed(context, route.aboutUs),),),
    ],
    ),
    ),
        // bottomNavigationBar: CurvedNavigationBar(
        //   color: Colors.deepPurpleAccent,
        //   height: 60,
        //   items: [
        //     Container(
        //       child: IconButton(
        //         icon: Icon(Icons.home),
        //         onPressed: () => Navigator.pushNamed(context, route.homepage),
        //       ),
        //     ),
        //     Container(
        //       child: IconButton(
        //         icon: Icon(Icons.show_chart),
        //         onPressed: () {},
        //       ),
        //     ),
        //     Container(
        //       child: IconButton(
        //         icon: Icon(Icons.person),
        //         onPressed: () => Navigator.pushNamed(context, route.aboutUs),
        //       ),
        //     ),
        //   ],
        // ),
        drawer: Drawer(
          backgroundColor: Colors.cyan,
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('User ABC'),
                accountEmail: Text('User@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset(
                      "assets/profile.png",
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: NetworkImage('https://financialexpresswpcontent.s3.amazonaws.com/uploads/2018/05/harley-davidson-bucherer-blue-edition-is-the-most-expensive-bike-ever-125625_1.jpg'),
                  fit: BoxFit.cover,
                )),
              ),
              ListTile(
                leading: Icon(Icons.policy),
                title: Text('Policies'),
                onTap: () => print('fav'),
              ),
              ListTile(
                leading: Icon(Icons.logout),
                title: Text('logout'),
                onTap: () {
                  AuthenticationRepository.instance.Logout();
                },
              ),
            ],
          ),
        ),


        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Stack(
                  children: [
                    Transform.rotate(
                      origin: Offset(30, -60),
                      angle: 2.4,
                      child: Container(
                        margin: EdgeInsets.only(
                          left: 85,
                          top: 190,
                        ),
                        height: 500,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(60),
                          gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            colors: [Colors.deepPurpleAccent, Colors.indigoAccent],
                          ),
                        ),
                      ),
                    ),


                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                print(currentIndex);
                              },
                              child: CarouselSlider(
                                items: imageList
                                    .map(
                                      (item) => Image.asset(
                                    item['image_path'],
                                    fit: BoxFit.cover,
                                    width: 1000,
                                  ),
                                )
                                    .toList(),
                                carouselController: carouselController,
                                options: CarouselOptions(
                             //     scrollPhysics: const BouncingScrollPhysics(),
                                  autoPlay: true,
                                  aspectRatio: 2,
                                   enlargeCenterPage: true,
                               //   viewportFraction: 1,
                                  onPageChanged: (index, reason) {
                                    setState(() {
                                      currentIndex = index;
                                    });
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 10,
                              left: 0,
                              right: 0,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: imageList.asMap().entries.map((entry) {
                                  return GestureDetector(
                                    onTap: () => carouselController.animateToPage(entry.key),
                                    child: Container(
                                      width: currentIndex == entry.key ? 18 : 7,
                                      height: 10,
                                      margin: const EdgeInsets.symmetric(
                                        horizontal: 5.0,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(20),
                                          color: currentIndex == entry.key
                                              ? Colors.white
                                              : Colors.teal),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: 20,),
                        Center(
                          child: Text("Select breakdown type",style: GoogleFonts.lato(
                            textStyle: Theme.of(context).textTheme.headlineLarge,
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 38),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 20),
                                child: ElevatedButton(
                                  onPressed: () => Navigator.pushNamed(
                                      context, route.servicepage),
                                  child: Container(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          "assets/img.png",
                                          height: 130,
                                          width: 100,
                                        ),
                                        Text('Petrol Vehicle')
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () => Navigator.pushNamed(
                                    context, route.ev),
                                child: Container(
                                  child: Column(
                                    children: [
                                      Center(
                                          child:  Lottie.asset("assets/splash9.json",
                                            height: 130,
                                            width: 100,
                                          ),
                                      ),
                                      Text('EV')
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 40,),
                        Padding(
                          padding: const EdgeInsets.only(left: 90),
                          child: Row(
                            children: [
                              SizedBox(
                                height: 45,
                                child: ElevatedButton.icon(
                                  onPressed: () async{
                                  final Uri url=Uri(
                                    scheme: 'tel',
                                    path: "9427019843",
                                  );
                                  if(await canLaunchUrl(url)){
                                    await launchUrl(url);
                                  }else{
                                    print("cannot launch");
                                  }
                                },
                                  style: ButtonStyle(

                                    backgroundColor: MaterialStatePropertyAll(Colors.blueAccent),

                                  ),
                                  icon: Icon(Icons.phone_forwarded),
                                  label: Text("Talk to Garage Expert"),
                                ),
                              ),
                            ],
                          ),
                        ),
                       SizedBox(height: 28,),
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Row(
                            children: [
                              SizedBox(height: 45,
                                width: 250,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 60),
                                  child: ElevatedButton.icon(
                                    onPressed: ()async{
                                      String latitude= '23.02997724910574';
                                      String longitude= '72.54253148947657';
                                      // const geourl = "https://maps.google.com/maps/search/?api=$map_api&query=$latitude,$longitude";
                                        String googleUrl =
                                            'comgooglemaps://?center=${latitude},${longitude}';
                                        String appleUrl =
                                            'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
                                        if (await canLaunchUrlString("comgooglemaps://")) {
                                          print('launching com googleUrl');
                                          await launchUrlString(googleUrl);
                                        } else if (await canLaunchUrlString(appleUrl)) {
                                          print('launching apple url');
                                          await launchUrlString(appleUrl);
                                        } else {
                                          throw 'Could not launch url';
                                        }
                                    },
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStatePropertyAll(Colors.blue,),
                                    ),
                                    icon: Icon(Icons.near_me),
                                    label: Text('location'),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
