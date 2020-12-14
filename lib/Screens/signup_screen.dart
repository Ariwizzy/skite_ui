import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skite_ui/Screens/login_screen.dart';
import 'package:skite_ui/Services/auth.dart';
import 'package:skite_ui/Widgets/text_input.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String password ='';
  String email ='';
  String number ='';
  String username ='';
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
                      "Welcome To OG Dev",
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
                      "Sign Up To Continue",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFf2f4f7),
                    ),
                    margin: EdgeInsets.only(top: 300, left: 40),
                    height: 450,
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
                            Text(
                              "Sign up",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(),),);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 45, top: 5),
                          color: Colors.yellow[700],
                          height: 2.5,
                          width: 100,
                        ),
                    Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          children: [
                            //email
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: "email Address"
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Invalid email Address";
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
                            //username
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Username"
                              ),
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Invalid User Name";
                                } else {
                                  return null;
                                }
                              },
                              onChanged: (val){
                                setState(() {
                                  username = val;
                                });
                              },
                            ),
                            //password
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Password"
                              ),
                              keyboardType: TextInputType.text,
                              validator: (val) {
                                if (val.length <= 5) {
                                  return "Password Must Be Greeter than 6";
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
                            //number
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: "Mobile Number"
                              ),
                              keyboardType: TextInputType.number,
                              validator: (val) {
                                if (val.isEmpty) {
                                  return "Invalid Phone  Number";
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
                          ],
                        ),
                      ),
                    ),
                        Center(
                          child: GestureDetector(
                            onTap: ()async{
                              if(_formKey.currentState.validate()){
                                dynamic result = await _auth.signUpWithDetails(email: email,password: password);
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
                                "Sign Up",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 17),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text("Or Sign Up With",style: TextStyle(fontWeight: FontWeight.w400,color: Colors.grey[600]),),
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
            ],
          ),
        ),
      ),
    );
  }
}
