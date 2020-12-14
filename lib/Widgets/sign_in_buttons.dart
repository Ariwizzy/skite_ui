import 'package:flutter/material.dart';
class SignInButton extends StatelessWidget {
  final Widget icon;
  final Color color;
  final String text;
  SignInButton({this.text,this.icon,this.color});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 45,
          margin: EdgeInsets.only(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            color: color,
          ),
          padding: EdgeInsets.symmetric(vertical: 0,horizontal: 5),
          child: Row(
            children: [
              IconButton(icon: icon,onPressed: (){},),
              // Text(
              //   text,
              //   style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
