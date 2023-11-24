import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:strong_security/model/driver.dart';
import 'package:strong_security/views/client/userPreferences/user_preferences.dart';
import 'package:strong_security/views/driver/dashboard/drverDashboard.dart';
import 'package:strong_security/views/signupIntro.dart';
import 'package:strong_security/views/client/dashboard/clientDashboard.dart';

import 'package:strong_security/utils.dart';
import 'package:http/http.dart' as http;

import '../../../../api_connection/api_connection.dart';
import '../../../../model/user.dart';
import '../sharedPreference/driverPreference.dart';
class FormDriver extends StatefulWidget {
  const FormDriver({super.key});

  @override
  State<FormDriver> createState() => _FormDriverState();
}

class _FormDriverState extends State<FormDriver> {
  bool animate = true;
  final _formfield = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passController = TextEditingController();
  bool passToggle = true;
  loginUserNow() async{
    try{
      var response=  await http.post(
        Uri.parse(API.loginDriver),
        body:  {
          "user_email": emailController.text.trim(),
          "user_password": passController.text.trim(),
        },
      );

      if (response.statusCode == 200) {
        var resBodyOfLogin = jsonDecode(response.body);
        // Check if "userData" key exists and is not null
        if (resBodyOfLogin['userData'] != null) {
          Map<String, dynamic> userData = resBodyOfLogin["userData"];


          if (resBodyOfLogin['success'] != null && resBodyOfLogin['success']) {
            Fluttertoast.showToast(
              msg: "Login Successfully",
              backgroundColor: Colors.blue,
              gravity: ToastGravity.BOTTOM,
              textColor: Colors.white,
            );

            Driver userInfo = Driver.fromJson(userData);

            await RememberDriverPref.storeDriverInfo(userInfo);
            Future<void>.delayed(Duration(seconds: 1), () {
              Get.to(() => DriverDashboard());
            });

          } else {
            Fluttertoast.showToast(
            msg: "Please enter Email or Password",
            backgroundColor: Color.fromRGBO(208, 52, 44, 1),
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white,
          );
          }
        } else {
          Fluttertoast.showToast(
              msg: "Please enter Email or Password",
              backgroundColor: Color.fromRGBO(208, 52, 44, 1),
              gravity: ToastGravity.BOTTOM,
              textColor: Colors.white,);
        }
      }
    }
    catch(e) {
      print(e);
    }
  }



  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
        margin: EdgeInsets.only(top: 50*fem,left: 3*fem),
        width: double.infinity,
        height: 350*fem,

        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 33*fem,
              height: 170*fem,
              margin: EdgeInsets.only(left: 0*fem),
              padding: EdgeInsets.only(left: 5*fem),
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                // color: Colors.blue
              ),
              child: Stack(
                  children: [
                    AnimatedPositioned(
                        duration:const Duration(milliseconds: 400),
                        top:animate?32*fem:138*fem,

                        child: Container(
                          width:  24*fem,
                          height: 24*fem,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                        )),
                    Positioned(
                        left: 4*fem,
                        top: 36*fem,
                        child: SizedBox(
                          width: 14*fem,
                          height: 14*fem,
                          child: Image.asset('images/images/mail-inbox-app-PbV.png'
                          ),
                        )),
                    Positioned(
                        left: 5*fem,
                        top: 143*fem,
                        child: SizedBox(
                            width: 16,
                            height: 16,
                            child: Image.asset('images/images/key-Jdu.png'))),
                  ]),
            ),

            Container(
              width: 270*fem,
              height: 350*fem,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                //       color: Colors.blue
              ),

              child: Form(
                key: _formfield,
                child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('EMAIL/PHONE NUMBER',
                        style:SafeGoogleFont (
                          'Poppins',
                          fontSize: 12*ffem,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff428adc),
                        ),
                      ),
                      TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          onTap: (){
                            setState(() {
                              if(animate==false) {
                                animate=true;
                              }
                            });
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10*fem),
                              ) ,
                              hintText: 'Email'
                          ),
                          validator: (input){
                            if(input!.isEmpty){
                              return "Enter Email";
                            }
                            bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$"
                            ).hasMatch(input);
                            if(!emailValid){
                              return "Enter Valid Email";
                            }
                            return null;
                          }



                      ),
                      SizedBox(
                        height: 32*fem,
                      ),
                      Text('PASSWORD',
                        style:SafeGoogleFont (
                          'Poppins',
                          fontSize: 12*ffem,
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff428adc),
                        ),
                      ),
                      TextFormField(

                        keyboardType: TextInputType.emailAddress,
                        onTap: (){
                          setState(() {
                            if(animate==true) {
                              animate= false;
                            }
                          });

                        },
                        controller: passController,
                        obscureText: passToggle,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10*fem),
                            ) ,
                            hintText: 'Password',
                            hintStyle: const TextStyle(color: Colors.grey),
                            suffix: InkWell(

                              onTap: (){
                                setState(() {
                                  passToggle = !passToggle;
                                });
                              },

                              child:Icon(passToggle? Icons.visibility_off:Icons.visibility),
                            )
                        ),
                        validator: (input){
                          if(input!.isEmpty){
                            return "Enter Password";
                          }
                          else if(passController.text.length<6){
                            return "Password Length Should Be More Than 6 Charachters";
                          }
                          return null;
                        },
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 30*fem,left: 65*fem),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(minimumSize: Size(120*fem, 30*fem)),
                          onPressed: () {
                            if(_formfield.currentState!.validate()){
                              loginUserNow();
                              print('sucess');

                            }

                          },
                          child: Text('LOGIN',
                            style:  SafeGoogleFont (
                              'Poppins',
                              fontSize: 15*ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.5*ffem/fem,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 0*fem,left: 30*fem),
                        child: TextButton(
                            onPressed: ()
                            {
                              Navigator.push(
                                  context, MaterialPageRoute(
                                  builder: (context)=> const SignUpIntro()
                              ));
                            }, child: RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: 'Don\'t have an account?',
                                    style:  SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 11*ffem,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.grey[700],
                                    ),
                                  ),
                                  WidgetSpan(child: SizedBox(
                                    width: 2*fem,
                                  )
                                  ),
                                  TextSpan(
                                    text: 'Signup',
                                    style:SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 12*ffem,
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0xff428adc),
                                    ),
                                  ),]
                            ))
                        ),
                      ),
                    ]
                ),
              ),
            )
          ],
        )

    );
  }
}
