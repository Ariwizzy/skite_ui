import 'package:flutter/material.dart';
import 'package:skite_ui/Services/auth.dart';
class Testing extends StatefulWidget {
  @override
  _TestingState createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String password="";
  String email="";
  String error ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 90,horizontal: 20),
        child: Column(
          children: [
            Form(
             key: _formKey,
                child: Column(
              children: [
                TextFormField(
                  validator: (val) {
                    if (val.length <= 5) {
                      return "Invalid email Number";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val){
                    setState(() {
                      email = val;
                    });
                  },
                ),
                TextFormField(
                  validator: (val) {
                    if (val.isEmpty) {
                      return "Invalid email Number";
                    } else {
                      return null;
                    }
                  },
                  onChanged: (val){
                    setState(() {
                      password = val;
                    });
                  },
                ),
                RaisedButton(onPressed: ()async{
                  if(_formKey.currentState.validate()){
                    dynamic result = await _auth.signInWithDetails(email: email,password: password);
                    if(result == null){
                      setState(() {
                        // error = "Invalid Email";
                        print(error);
                      });
                    }
                  }
                },
                  child: Text("validate"),)
              ],
            )),
          ],
        ),
      ),
    );
  }
}
