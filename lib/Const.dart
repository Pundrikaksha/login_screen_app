import 'package:flutter/material.dart';

class BuildButton extends StatelessWidget {
  BuildButton({this.onTap, this.str,this.color});
  final Function onTap;
  final String str;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:20.0),
      child: SizedBox(
        width: 350,
        height: 60,
        child: RaisedButton(
          elevation: 15,
color:color,
         shape:RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(50),
           side: BorderSide(color: Colors.lightBlueAccent[700], width: 2)
         ) ,
          onPressed: onTap,
          child: Text(str),
        ),
      ),
    );
  }
}

class BuildTextField extends StatelessWidget {
  BuildTextField({this.onTap, this.isObscure : false,this.labelText,this.validator});
  final Function onTap;
  final bool isObscure;
  final String labelText;
  final Function validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:8.0,),
      child: SizedBox(
        height: 60,
        width: 350,
        child: TextFormField(
          validator:validator??(value){
            return null;
          },
          onChanged: onTap,
          obscureText: isObscure,
          decoration:InputDecoration(
            labelText: labelText,
            fillColor: Colors.white,
         border:OutlineInputBorder(

          borderRadius: BorderRadius.circular(50) ,

         ),
          ),



        ),
      ),
    );
  }
}
