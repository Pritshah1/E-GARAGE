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
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'garage_data.dart';

// class EV extends StatelessWidget {
//   const EV({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("aksjdgh"),
//       ),
//     );
//   }
// }

class EV extends StatefulWidget {
  const EV({Key? key}) : super(key: key);

  @override
  _AllStoresState createState() => _AllStoresState();
}

class _AllStoresState extends State<EV> {
  Position? _currentUserPosition;
  double? distanceImMeter = 0.0;
  Data data = Data();

  Future _getTheDistance() async {
    _currentUserPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    for (int i = 0; i < data.allstores.length; i++) {
      double storelat = data.allstores[i]['lat'];
      double storelng = data.allstores[i]['lng'];

      distanceImMeter = await Geolocator.distanceBetween(
        _currentUserPosition!.latitude,
        _currentUserPosition!.longitude,
        storelat,
        storelng,
      );
      var distance = distanceImMeter?.round().toInt();

      data.allstores[i]['distance'] = (distance! / 100);
      setState(() {});
    }
  }

  @override
  void initState() {
    _getTheDistance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Color(0xff79c200),
        title: Text("Detailes of EV Servicecenter"),
      ),
      body: Padding(

        padding: const EdgeInsets.fromLTRB(2, 5, 2, 0),
        child: ListView.builder(
            itemCount: data.allstores.length,
            itemBuilder: (context, index) {
              return Container(
               // color: Color(0xff79c200),
                margin: EdgeInsets.only(top: 13,),
                height: height *0.41,
                width: width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                      Dimensions.radius20),
                  color: Colors.green,
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
                      image: NetworkImage(
                        data.allstores[index]['image'],

                      ),
                    ),),),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      data.allstores[index]['name'],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  //  Text(
                    //  data.allstores[index]['phone'].toString(),
                    //),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on),
                        Text(
                          "${data.allstores[index]['distance'].round()} KM Away",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(Dimensions.radius20),
                        color: Colors.teal,
                      ),
                      child: Marquee(
                        child: Row(
                          children: [
                            Text("  Address : ",style: TextStyle(fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,),),
                            Text(
                              data.allstores[index]['address'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: ElevatedButton.icon(
                            onPressed: () async{
                              final Uri url=Uri(
                                scheme: 'tel',
                                path: data.allstores[index]['phone'].toString(),
                              );
                              if(await canLaunchUrl(url)){
                                await launchUrl(url);
                              }else{
                                print("cannot launch");
                              }
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(Color(0xff79c200))),
                            icon: Icon(Icons.add_ic_call),
                            label: Text('Call Garage '),
                          ),
                        ),
                        SizedBox(width: 70,),
                        ElevatedButton.icon(
                          onPressed: () async{
                            String lat= data.allstores[index]['lat'].toString();
                            String lng= data.allstores[index]['lng'].toString();
                            String geourl = 'geo:$lat,$lng';
                            if(await canLaunchUrlString(geourl)){
                              launchUrlString(geourl);
                            }else{
                              print("cant launch");
                            }
                          },
                          style:  ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(Color(0xff79c200))),
                          icon: Icon(Icons.near_me),
                          label: Text('Location'),),
                      ],
                    ),
                  ],
                ),
              );
            }),
      ),
    );
  }
}

