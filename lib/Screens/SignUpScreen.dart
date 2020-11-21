import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../Const.dart';
import 'HomeScreen.dart';
import 'OnBoardingScreen.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email;
  String password;
  String confirmPassword;
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:5.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle( fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color:  Colors.indigo[300]
                    ),
                  ),
                ),
                Divider(
                  color: Colors.blueGrey,
                  height: 25,
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
                BuildTextField(
                  labelText: "confirm password",
                  validator: (value) {
                    if (password != confirmPassword) {
                      return 'Password did not match';
                    }
                    return null;
                  },
                  onTap: (text) {
                    confirmPassword = text;
                  },
                  isObscure: true,
                ),
                BuildButton(
                  onTap: () async {
                    if (_formKey.currentState.validate()) {
                      final user = await _auth.createUserWithEmailAndPassword(
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
                    }},
                  str: "Submit",

                ),
              ],
            ),
          ),
        ),
      ),
    );
    ;
  }
}
