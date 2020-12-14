import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skite_ui/Screens/signup_screen.dart';
import 'package:skite_ui/Services/auth.dart';
import 'package:skite_ui/Widgets/text_input.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String password ='';
  String email ='';
  String error = '';
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFd0dbf5),
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF7291db),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    height: 500,
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 100, left: 10),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow[800],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 140, left: 10),
                    child: Text(
                      "Sign In To Continue",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey[300],
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFf2f4f7),
                    ),
                    margin: EdgeInsets.only(top: 300, left: 40),
                    height: 320,
                    width: 370,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(),),);
                              },
                              child: Text(
                                "Sign up",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ),
                            Text(
                              "Login",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 229, top: 5),
                          color: Colors.yellow[700],
                          height: 2.5,
                          width: 100,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextInput(
                                onChanged: (val){
                                  setState(() {
                                    email = val;
                                  });
                                },
                                obscureText: false,
                                icon: Icons.person,
                                text: "Email",
                                function: (val) {
                                  if (val.length <=4) {
                                    return "Invalid Email";
                                  } else {
                                    return null;
                                  }
                                },
                                getter: TextInputType.text,
                              ),
                              TextInput(
                                onChanged: (val){
                                  setState(() {
                                    password = val;
                                  });
                                },
                                surfix: GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      showPassword =!showPassword;
                                    });
                                  },
                                    child: Icon(showPassword ? Icons.visibility :Icons.visibility_off),
                                ),
                                obscureText: !showPassword,
                                icon: Icons.privacy_tip_outlined,
                                text: "password",
                                function: (val) {
                                  if (val.length == 0) {
                                    return "Email cannot be empty";
                                  } else {
                                    return null;
                                  }
                                },
                                getter: TextInputType.text,
                              ),
                            ],
                          ),
                        ),
                        Center(
                          child: GestureDetector(
                            onTap: ()async{
                              if(_formKey.currentState.validate()){
                                dynamic result = await _auth.signInWithDetails(email: email,password: password);
                                if(result == null){
                                  setState(() {
                                    error = "Invalid Email";
                                  });
                                }
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.yellow[900],
                              ),
                              margin: EdgeInsets.only(top: 25),
                              padding: EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 22),
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(error,style: TextStyle(color: Colors.red),)
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 175,
              ),
              Text("Or Sign In With",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey[600]),),
              SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FaIcon(FontAwesomeIcons.facebookSquare,color: Colors.blue,size: 39,),
                  FaIcon(FontAwesomeIcons.twitter,color: Colors.blue,size: 39,),
                  FaIcon(FontAwesomeIcons.google,color: Colors.blue,size: 39,),
                ],
              ),
              // SignInButton(color: Colors.blue,text: "Facebook",),
            ],
          ),
        ),
      ),
    );
  }
}
