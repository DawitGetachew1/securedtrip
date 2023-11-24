import 'dart:convert';



import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strong_security/api_connection/api_connection.dart';

import 'package:strong_security/views/client/details/clientDetails.dart';
import 'package:strong_security/views/signupIntro.dart';
import 'dart:math' as math;
import '../../../../model/user.dart';
import '../../../../utils.dart';
import 'package:http/http.dart' as http;



class ClientInfo extends StatefulWidget {
  XFile cProfile;
  ClientInfo(this.cProfile);

  @override
  State<ClientInfo> createState() => _ClientInfoState();
}

class _ClientInfoState extends State<ClientInfo> {

  final _formfield = GlobalKey<FormState>();
  bool passToggle = true;

  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final userNameController = TextEditingController();

  final phoneNoController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();



 void validateUserEmail() async{

    try{
      var response =  await http.post(
           Uri.parse(
               API.validiateEmailClient,),
           body: {
             'user_email': emailController.text.trim()
           }
               );
      if(response.statusCode==200){
        var resBodyOfValidateEmail = jsonDecode(response.body);
        if(resBodyOfValidateEmail['correctEmail']) {
          if (resBodyOfValidateEmail['emailFound']) {
            Fluttertoast.showToast(
                msg: "Email is already in someone else use. Try another Email.");
          }
          else {
            print("success");
            User userModel = User(
              1,
              firstNameController.text.trim(),
              lastNameController.text.trim(),
              userNameController.text.trim(), 
              phoneNoController.text.trim(),
              emailController.text.trim(),
              passwordController.text.trim(),

            );
            Future<void>.delayed(Duration(seconds: 1), () {
              Get.to(() => ClientDetail(userModel, widget.cProfile));
            });
          }
        }
        else {
          Fluttertoast.showToast(
              msg: "Please Enter a valid email");

        }
        }
        }
    catch(e){

      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());

    }
}
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return  Form(
      key: _formfield,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 20*fem,
              ),
              Text(
                'First name *',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 10*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
              SizedBox(
                width: 10*fem,
              ),
              SizedBox(
                width: 185*fem,

                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,

                  controller: firstNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,
                    contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                  ),
                  validator: (input){
                    if(input!.isEmpty){
                      return "Enter Your First Name";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12*fem ,
          ),
          Row(
            children: [
              SizedBox(
                width: 20*fem,
              ),
              Text('Last name *',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 10*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
              SizedBox(
                width: 10*fem,
              ),
              SizedBox(
                width: 185*fem,

                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,

                  controller: lastNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,
                    contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                  ),
                  validator: (input){
                    if(input!.isEmpty){
                      return "Enter Your Last Name";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12*fem ,
          ),
          Row(
            children: [
              SizedBox(
                width: 20*fem,
              ),
              Text('User name ',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 10*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
              SizedBox(
                width: 13*fem,
              ),
              SizedBox(
                width: 185*fem,

                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onTap: (){
                  },
                  controller: userNameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,
                    contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12*fem ,
          ),
          Row(
            children: [
              SizedBox(
                width: 20*fem,
              ),
              Text('Phone no *',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 10*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
              SizedBox(
                width: 15*fem,
              ),
              SizedBox(
                width: 185*fem,

                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  onTap: (){

                  },
                  controller: phoneNoController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,
                    contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                  ),
                  validator: (input){
                    if(input!.isEmpty){
                      return "Enter Your Phone Number";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 12*fem ,
          ),
          Row(
            children: [
              SizedBox(
                width: 20*fem,
              ),
              Text('email *',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 10*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
              SizedBox(
                width: 34*fem,
              ),
              SizedBox(
                width: 185*fem,

                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onTap: (){


                  },
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,
                    contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
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
              ),
            ],
          ),
          SizedBox(
            height: 12*fem ,
          ),
          Row(
            children: [
              SizedBox(
                width: 20*fem,
              ),
              Text('Password *',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 10*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
              SizedBox(
                width: 12*fem,
              ),
              SizedBox(
                width: 185*fem,

                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  onTap: (){


                  },
                  controller: passwordController,
                  obscureText: passToggle,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,
                    contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
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
                    else if(passwordController.text.length<6){
                      return "Password Length Should Be More Than 6 Charachters";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20*fem,

          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // group64Dq1 (5:4271)
                margin: EdgeInsets.fromLTRB(0*fem, 20*fem, 0*fem, 0*fem),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context)=> const SignUpIntro()
                    ));
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: SizedBox(
                    width: 18*fem,
                    height: 20*fem,
                    child: Image.asset(
                      'images/images/group-64.png',
                      width: 18*fem,
                      height: 20*fem,
                    ),
                  ),
                ),
              ),
              Container(
                // group64Dq1 (5:4271)
                margin: EdgeInsets.fromLTRB(0*fem, 20*fem, 0*fem, 0*fem),
                child: TextButton(
                  onPressed: () {
                    if(_formfield.currentState!.validate()) {
                     validateUserEmail();
                    }
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: SizedBox(
                    width: 18*fem,
                    height: 20*fem,
                    child:Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.rotationY(math.pi),
                      child: Image.asset(
                        'images/images/group-64.png',
                        width: 18*fem,
                        height: 20*fem,
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}




