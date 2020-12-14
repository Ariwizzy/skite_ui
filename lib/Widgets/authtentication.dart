import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_ui/Model/user.dart';
import 'package:skite_ui/Screens/home_screen.dart';
import 'package:skite_ui/Screens/signup_screen.dart';
import 'package:skite_ui/Widgets/testing.dart';
class Authentication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if(user == null){

      return SignUp();
    }else{
      return HomeScreen();
    }
  }
}
