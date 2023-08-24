import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:egarage/route/route.dart' as route;

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {

@override
  void initState() {
    // TODO: implement initState
  Future.delayed(Duration(seconds: 3),(){
    Navigator.pushNamed(context,route.signupPage);
  });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
  return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Lottie.asset("assets/splash1.json",
              height: 320,
              width: 320,),
            SizedBox(height: 30,width: 500,),
            Text("Egarage",style: GoogleFonts.lato(
              textStyle: Theme.of(context).textTheme.headline5,
              color: Colors.purple,
              fontSize: 60,
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.italic,
            ),
            ),

             Padding(
               padding: const EdgeInsets.fromLTRB(90, 10, 0, 0),
               child: Text("by H8888",style: GoogleFonts.lato(
                 textStyle: Theme.of(context).textTheme.headline5,
                 color: Colors.purple,
                 fontSize: 20,
                 fontWeight: FontWeight.w700,
                 fontStyle: FontStyle.italic,
               ),),
             ),
          ],
        ),
      ),
    ),
  );
  }
}
