import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login_screen_app/Screens/OnBoardingScreen.dart';

import '../Const.dart';
import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email;
  String password;
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login",
                style: TextStyle( fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color:  Colors.indigo[300]
                ),
              ),
              Divider(

                height: 25,

                color: Colors.blueGrey,
              ),

              BuildTextField(
                labelText: "Email",
                onTap: (text) {
                  email = text;
                },
              ),
              BuildTextField(
                labelText: "password",
                onTap: (text) {
                  password = text;
                },
                isObscure: true,
              ),
              BuildButton(
                onTap: () async {
                  final user = await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  try {
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                str: "Submit",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
