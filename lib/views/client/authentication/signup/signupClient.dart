import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:strong_security/utils.dart';

import 'package:image_picker/image_picker.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';


import 'package:strong_security/api_connection/api_connection.dart';
import 'package:strong_security/views/client/authentication/signup/clientInfo.dart';

import 'package:strong_security/views/client/details/clientDetails.dart';

import 'package:strong_security/views/signupIntro.dart';
import 'dart:math' as math;
import '../../../../model/user.dart';

import 'package:http/http.dart' as http;
class SignUpClient extends StatefulWidget {
   SignUpClient({super.key});

  @override
  State<SignUpClient> createState() => _SignUpClientState();
}

class _SignUpClientState extends State<SignUpClient> {

  XFile?  _cProfile;
  final firstNameController = TextEditingController();

  final lastNameController = TextEditingController();

  final userNameController = TextEditingController();

  final phoneNoController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  Future getImage(ImageSource media) async {
    final picker = ImagePicker();
    final   XFile? pickedFile = await picker.pickImage(source: media);

    setState(() {
      if (pickedFile != null) {
        _cProfile = pickedFile;
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
         // height: 400*fem,
          margin: EdgeInsets.only(top: 70*fem),
          // decoration: BoxDecoration(
          //   shape: BoxShape.rectangle,
          //   color: Colors.blue
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                    'BASIC INFO',
            textAlign: TextAlign.center,
            style: SafeGoogleFont (
              'Poppins',
              fontSize: 20*ffem,
              fontWeight: FontWeight.w700,
              height: 1.5*ffem/fem,
              color: const Color(0xff428adc),
            ),
          ),
                ),
             Row(
               children: [
                 Container(
                   // group19Uoy (5:4313)
                  margin: EdgeInsets.only(left:30*fem,top: 20*fem, ),
                   width: 30*fem,
                   height: 30*fem,
                   decoration: const BoxDecoration (
                     shape: BoxShape.circle,
                     ),
                   child: TextButton(
                     onPressed: (){
                          getImage(ImageSource.gallery);
                     },
                     child: Image.asset('images/images/add-image.png',
                     fit: BoxFit.cover,
                     ),
                   ),
                 ),

                 _cProfile != null
                     ? Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 0),
                   child: ClipRRect(
                     borderRadius: BorderRadius.circular(8),
                     child: Image.file(
                       //to show image, you type like this.
                       File(_cProfile!.path),
                       fit: BoxFit.cover,
                       width: 50,
                       height: 50,
                     ),
                   ),
                 )

                     : Text(
                   "No Image",
                   style: TextStyle(fontSize: 20),
                 ),





                 Container(
                   // addyourprofilepictureherehgj (5:4306)
                   margin: EdgeInsets.fromLTRB(20*fem, 18*fem, 0*fem, 0*fem),
                   child: TextButton(
                     onPressed: (){
                       getImage(ImageSource.gallery);
                     },
                     child: Text(
                       'Add your profile picture here',
                       style: SafeGoogleFont (
                         'Poppins',
                         fontSize: 10*ffem,
                         fontWeight: FontWeight.w500,
                         height: 1.5*ffem/fem,
                         color: const Color(0xff428adc),
                       ),
                     ),
                   ),
                 ),
               ],
             ),

              Container(
                margin: EdgeInsets.only(top:10*fem,left: 5*fem),
                width: 300*fem,
                height: 460*fem,

                child:  ClientInfo(_cProfile??XFile(''))






              )

            ],
          ),
        ),
      ),
    );
  }
}
