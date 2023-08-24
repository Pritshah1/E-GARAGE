import 'package:flutter/material.dart';
import 'package:egarage/screens/aboutUs.dart';
import 'package:egarage/screens/homePage.dart';
import 'package:egarage/screens/signup.dart';
import 'package:egarage/screens/login.dart';
import 'package:egarage/screens/service.dart';
import 'package:egarage/screens/otp.dart';
import 'package:egarage/screens/EV.dart';
import 'package:egarage/screens/splash.dart';
import 'package:egarage/screens/Profile.dart';

//route names

const String homepage ='homepage';
const String loginPage ='login';
const String signupPage ='signup';
const String aboutUs ='aboutUs';
const String servicepage ='service';
const String otpscreen ='otp';
const String ev ='ev';
const String splash='splash';
const String Profile='Profile';

// control out route flow

Route<dynamic> controller(RouteSettings settings){

  switch(settings.name){
    case homepage:
      return MaterialPageRoute(builder: (context) => Homepage());
    case loginPage:
      return MaterialPageRoute(builder: (context) => LoginPage());
    case aboutUs:
      return MaterialPageRoute(builder: (context) => AboutUs());
    case signupPage:
      return MaterialPageRoute(builder: (context) => SignupPage());
    case servicepage:
      return MaterialPageRoute(builder: (context) => Servicespage());
    case otpscreen:
      return MaterialPageRoute(builder: (context) => Otpscreen());
    case ev:
      return MaterialPageRoute(builder: (context) => EV());
    case splash:
      return MaterialPageRoute(builder: (context) => Splash());
    case Profile:
      return MaterialPageRoute(builder: (context) => profile());


    default:
      throw('this route dosent exist');
  }


}
