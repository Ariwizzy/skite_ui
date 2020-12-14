import 'package:flutter/material.dart';
import 'package:skite_ui/Services/auth.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    print(_authService.user);
    return Scaffold(
      appBar: AppBar(
        title: Text("Fuck U"),
        actions: [
          FlatButton.icon(
              onPressed: () {
                _authService.signOut();
              },
              icon: Icon(
                Icons.person,
                color: Colors.white,
              ),
              label: Text(
                "LogOut",
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
    );
  }
}
