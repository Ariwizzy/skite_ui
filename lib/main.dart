import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:skite_ui/Model/user.dart';
import 'package:skite_ui/Services/auth.dart';
import 'package:skite_ui/Widgets/authtentication.dart';

void main() async{
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,

          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Authentication(),
      ),
    );
  }
}


