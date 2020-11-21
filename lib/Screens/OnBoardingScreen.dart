import 'package:flutter/material.dart';
import '../Const.dart';
import 'LoginScreen.dart';
import 'SignUpScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Text(
                  "Welcome",
                  style: TextStyle( fontSize: 50,
                      fontWeight: FontWeight.bold,
                    color:  Colors.indigo[300]
                  ),
                ),
              ), Padding(
          padding: const EdgeInsets.symmetric(vertical:40.0),
          child:Image(
            image:AssetImage( 'images/a.png'),
          )
      ),

           Padding(
                padding: const EdgeInsets.all(25.0),
                child: BuildButton(
                  str: "Login",

                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginScreen(),
                      ),
                    );
                  },
                ),
              ),
              BuildButton(
                str: "Sign Up",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignUpScreen(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

