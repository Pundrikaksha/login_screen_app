import 'package:flutter/material.dart';
import 'package:login_screen_app/Screens/OnBoardingScreen.dart';

import 'package:firebase_core/firebase_core.dart';
void main() async{
WidgetsFlutterBinding.ensureInitialized();
Firebase.initializeApp();
  runApp( MaterialApp (

    debugShowCheckedModeBanner: false,
    home:OnBoardingScreen() ,
  ));
}

