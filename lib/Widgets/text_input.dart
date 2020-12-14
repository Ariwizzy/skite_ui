import 'package:flutter/material.dart';
class TextInput extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextInputType getter;
  final Function function,onChanged;
  final bool obscureText ;
  final Widget surfix;
  TextInput({this.text,this.icon,this.function,this.getter,this.onChanged,this.obscureText,this.surfix});
  @override
  Widget build(BuildContext context) {
    var inputBorder =BorderRadius.circular(15.0);
    return Container(
      padding:
      EdgeInsets.only(left: 10, right: 10, top: 20),
      height: 75,
      child: TextFormField(

         obscureText: obscureText,
        onChanged: onChanged,
        decoration: new InputDecoration(
          suffixIcon: surfix,
          enabledBorder:  OutlineInputBorder(
            borderSide:  BorderSide(
              color: Colors.grey[300],
              width: 1.5,
            ),
            borderRadius: inputBorder,
          ),
          prefixIcon: Icon(
            icon,
            color: Color(0xFF7291db),
          ),
          hintText: text,
          hintStyle: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey),
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: inputBorder,
            borderSide:  BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
          ),
          //fillColor: Colors.green
        ),
        validator: function,
        keyboardType: getter,
      ),
    );
  }
}
// TextInputType
//     (val) {
//   if (val.length == 0) {
//     return "Email cannot be empty";
//   } else {
//     return null;
//   }
// },