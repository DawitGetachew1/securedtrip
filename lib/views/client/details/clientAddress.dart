
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strong_security/model/countrylist.dart';
import 'package:strong_security/model/user_address.dart';
import 'package:strong_security/model/user_detail.dart';
import 'package:strong_security/views/client/details/clientTerm.dart';

import 'package:strong_security/views/signupIntro.dart';

import '../../../api_connection/api_connection.dart';
import '../../../model/combinedUserDat.dart';
import '../../../model/user.dart';
import '../../../utils.dart';

class ClientAddress extends StatefulWidget {
  final User userModel;
  final UserDetail userDetail;
  XFile idFront;
  XFile idBack;
  XFile cProfile;
  ClientAddress(this.userModel,this.cProfile,this.userDetail,this.idFront,this.idBack);

  @override
  State<ClientAddress> createState() => _ClientAddressState();
}

class _ClientAddressState extends State<ClientAddress> {


   final regionController = TextEditingController();

   final zoneController = TextEditingController();

   //final subcityController = TextEditingController();

   final poboxController = TextEditingController();

   String selectedCountry = 'Ethiopia';
   String selectedSubcity = 'Addis Ketema';
   bool colorChange = false;
 SaveUserAddress() async {
   UserAddress userAddress = UserAddress(

       selectedCountry,
       regionController.text.trim(),
       zoneController.text.trim(),
       selectedSubcity,
       poboxController.text.trim()
     //subcityController.text.trim(),

   );
   Future<void>.delayed(Duration(seconds: 1), () {
     Get.to(() => ClientTerms(widget.userModel, widget.cProfile,widget.userDetail,userAddress,widget.idFront,widget.idBack));
   });

 }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 70*fem,left: 20*fem),
        child: Column(
          children: [
            Align(
              child: Text(
                'ADDRESS DETAIL',
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
            SizedBox(height: 100*fem,),
            Row(
              children: [
                SizedBox(
                  width: 50*fem,
                ),
                Text(
                  'Country *',
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
                Container(
                  width: 136*fem,
                  height: 38*fem,

                  padding: EdgeInsets.only(left: 10*fem),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10*fem),
                      border: Border.all(width: 0.5)
                  ),

                  child: DropdownButton<String>(
                    value: selectedCountry,
                    style: const TextStyle(color: Colors.blue),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCountry = newValue!;
                      });
                    },
                  //  style: TextStyle(color: Colors.white),
                    borderRadius: BorderRadius.circular(10*fem),
                    underline: Container(),


                    items: CountList().customCountryList.map<DropdownMenuItem<String>>((String country) {
                      return DropdownMenuItem<String>(
                        value: country,
                        child: Text(country, ),
                      );
                    }).toList(),

                  )
                  ),
              ],
            ),
            SizedBox(
              height: 12*fem ,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50*fem,
                ),
                Text('Region',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: 10*ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.5*ffem/fem,
                    color: const Color(0xff428adc),
                  ),
                ),
                SizedBox(
                  width: 22*fem,
                ),
                SizedBox(
                  width: 136*fem,
                  height: 38*fem,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    controller: regionController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,

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
                  width: 50*fem,
                ),
                Text('Zone',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: 10*ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.5*ffem/fem,
                    color: const Color(0xff428adc),
                  ),
                ),
                SizedBox(
                  width: 33*fem,
                ),
                SizedBox(
                  width: 136*fem,
                  height: 38*fem,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onTap: (){


                    },
                    controller: zoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,

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
                  width: 50*fem,
                ),
                Text('Sub City',
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

                Container(
                    width: 136*fem,
                    height: 38*fem,

                    padding: EdgeInsets.only(left: 10*fem),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10*fem),
                        border: Border.all(width: 0.5)
                    ),

                    child: DropdownButton<String>(
                      value: selectedSubcity,
                      style: const TextStyle(color: Colors.blue),
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedSubcity = newValue!;
                        });
                      },
                      //  style: TextStyle(color: Colors.white),
                      borderRadius: BorderRadius.circular(10*fem),
                      underline: Container(),


                      items: CountList().subcityCountryList.map<DropdownMenuItem<String>>((String subcity) {
                        return DropdownMenuItem<String>(
                          value: subcity,
                          child: Text(subcity, ),
                        );
                      }).toList(),

                    )
                ),



              ],
            ),













            SizedBox(
              height: 12*fem ,
            ),
            Row(
              children: [
                SizedBox(
                  width: 50*fem,
                ),
                Text('P.0 BOX',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: 10*ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.5*ffem/fem,
                    color: const Color(0xff428adc),
                  ),
                ),
                SizedBox(
                  width: 18*fem,
                ),
                SizedBox(
                  width: 136*fem,
                  height: 38*fem,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    onTap: (){


                    },
                    controller: poboxController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,

                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 60*fem,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
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
                    width: 22*fem,
                    height: 22*fem,
                    child: Image.asset(
                      'images/images/home-p8w.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 0*fem,),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: SizedBox(
                    width: 14*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'images/images/polygon-1-bF5.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                TextButton(
                  onPressed: () {
                    SaveUserAddress();
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: SizedBox(
                    width: 14*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'images/images/polygon-4.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
