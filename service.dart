import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:egarage/route/route.dart' as route;
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher_string.dart';
import '../utils/dimensions.dart';
import 'garage_data.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:marquee_widget/marquee_widget.dart';

class Servicespage extends StatefulWidget {
  @override
  State<Servicespage> createState() => _ServicespageState();
}
class _ServicespageState extends State<Servicespage> {
  List garage= [];
  var curr_latitude = "Getting latitude".obs;
  var curr_longitude = "Getting longitude".obs;
  @override
  Position? _currentUserPosition;
  double? distanceImMeter = 0.0;

 // get phone => string;
  //Data data = Data();

  double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  fetchgarage() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    curr_latitude.value = '${position.latitude}';
    curr_longitude.value = '${position.longitude}';
    var url = "https://egarage8888.000webhostapp.com/display_garage.php";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var items = json.decode(response.body);

      setState(() {
        garage = items;
        print(garage);
      });
    } else {
      setState(() {
        garage = [];
      });
    }
    for (int i = 0; i < garage.length; i++) {
      garage[i]["distance"] = calculateDistance(
          double.parse(garage[i]["latitude"].toString()),
          double.parse(garage[i]["longitude"].toString()),
          double.parse(curr_latitude.toString()),
          double.parse(curr_longitude.toString()))
          .toStringAsFixed(1)
          .toString();
    }
    garage.sort((a, b) {
      return double.parse(a["distance"].toString())
          .compareTo(double.parse(b["distance"].toString()));
    });
    // print(garage);
  }

  // Future _getTheDistance() async {
  //   // print("Hello");
  //   _currentUserPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  //
  //   for (int i = 0; i < garage.length; i++) {
  //     double storelatitude = garage[i]['latitude'];
  //     double storelongitude = garage[i]['longitude'];
  // // print(storelatitude);
  //     distanceImMeter = await Geolocator.distanceBetween(
  //       _currentUserPosition!.latitude,
  //       _currentUserPosition!.longitude,
  //       storelatitude,
  //       storelongitude,
  //     );
  //     var distance = distanceImMeter?.round().toInt();
  //
  //     garage[i]['distance'] = (distance! / 100);
  //     setState(() {});
  //   }
  // }

  @override
  void initState() {
    // _getTheDistance();
    fetchgarage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyan,
        title: Text("Garages"),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(2, 5, 2, 0),
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: garage.length,
            itemBuilder: (context, index) {
              return Container(
               // color: Colors.blueAccent,
                margin: EdgeInsets.only(top: 13,),
                height: height *0.41,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      Dimensions.radius20),
                  color: Colors.blueAccent,

                ),
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 350,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    Dimensions.radius20),
                color: Colors.white38,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                       image :NetworkImage( garage[index]['imageurl'])

                      ),
                    ),),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      garage[index]['user_name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),

                    SizedBox(
                      height: 4,
                    ),
                    Container(

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.location_on),
                          Text(
                            "${garage[index]['distance']} KM Away",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),

                  //  Text(garage[index]['phone'].toString())
                        ],
                      ),
                    ),
                      SizedBox(height: 3,),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Dimensions.radius20),
                          color: Colors.lightBlue,
                        ),
                        child: Marquee(
                          child: Row(
                            children: [
                              Text("Address : ",style: TextStyle(fontSize: 19,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,),),
                              Text(garage[index]['street'].toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                ",  ${garage[index]['city']}",
                                style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              ),
                              Text( ",  ${garage[index]['pincode'].toString()}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),),
                            ],
                          ),
                        ),
                      ),
                    SizedBox(height: 3),
                    Center(
                      child: Row(
                        children: [

                          SizedBox(width: 10,),
                          ElevatedButton.icon(
                            onPressed: () async{
                            final Uri url=Uri(
                              scheme: 'tel',
                              path: garage[index]['phone'].toString(),
                            );
                            if(await canLaunchUrl(url)){
                              await launchUrl(url);
                            }else{
                              print("cannot launch");
                            }
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Colors.cyan)),
                            icon: Icon(Icons.add_ic_call),
                            label: Text('Call Garage '),
                          ),
                          SizedBox(width: 70,),
                          ElevatedButton.icon(
                            onPressed: ()  async{
                              String latitude= garage[index]['latitude'].toString();
                              String longitude= garage[index]['longitude'].toString();
                              String geourl = 'geo:${latitude},${longitude}';
                              if(await canLaunchUrlString(geourl)){
                                launchUrlString(geourl);
                              }else{
                                print("cant launch");
                              }
                            },
                            style:  ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Colors.cyan)),
                            icon: Icon(Icons.near_me),
                            label: Text('Location'),),

                        ],
                      ),

                    ),
                    SizedBox(height: 2,),
                    // Row(
                    //   children: [
                    //     Padding(
                    //       padding: const EdgeInsets.fromLTRB(17,2.0,12,00),
                    //       child: Text(
                    //         garage[index]['phone'].toString(),
                    //         style: TextStyle(
                    //           fontSize: 18,
                    //           fontWeight: FontWeight.bold,
                    //           color: Colors.black87,
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

