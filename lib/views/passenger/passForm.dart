
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:strong_security/model/countrylist.dart';
import 'package:strong_security/model/user_address.dart';
import 'package:strong_security/model/user_detail.dart';
import 'package:strong_security/views/client/details/clientTerm.dart';
import 'package:strong_security/views/passenger/passFinal.dart';
import 'package:strong_security/views/passenger/passTransportSec.dart';

import 'package:strong_security/views/signupIntro.dart';

import '../../../api_connection/api_connection.dart';
import '../../../model/combinedUserDat.dart';
import '../../../model/user.dart';
import '../../../utils.dart';

class PassOrder extends StatefulWidget {

  PassOrder({super.key});

  @override
  State<PassOrder> createState() => _PassOrderState();
}

class _PassOrderState extends State<PassOrder> {


  final nameController = TextEditingController();

  final phoneController = TextEditingController();
  bool isDropdown = false;
  TextEditingController controller = TextEditingController();
  DateTime dateTime = DateTime(
    2023,
    09,
    24,
  );
  String dateFinal="2023-09-24";
  List<String> orders = [
    'TRANSPORT',
    'TRANSPORT AND SECURITY',
  ];
  final _formfield = GlobalKey<FormState>();
  TimeOfDay? _selectedTime;
  String _buttonText = '12:00 PM';

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        _buttonText = DateFormat.jm().format(
          DateTime(DateTime.now().year, DateTime.now().month,
              DateTime.now().day, picked.hour, picked.minute),
        );
      });
    }
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: dateTime,
      firstDate: DateTime(1900),
      lastDate: DateTime(2100));

  SaveTransportRequest() async {

    // Future<void>.delayed(Duration(seconds: 1), () {
    //   Get.to(() => ClientTerms(widget.userModel, widget.cProfile,widget.userDetail,userAddress,widget.idFront,widget.idBack));
    // });

  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 50*fem,left: 20*fem),
        child: Column(
          children: [

            SizedBox(height: 30*fem,),

            Align(
              child: Text(
                'CHOOSE ORDER',
                style: SafeGoogleFont(
                  'Poppins',
                  fontSize: 14 * ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5 * ffem / fem,
                  color: const Color(0xff428adc),
                ),
              ),
            ),
            SizedBox(
              height: 215 * fem,
              width: double.infinity,
              // decoration: BoxDecoration(
              //   shape: BoxShape.rectangle,
              //   color: Colors.blue
              // ),
              child: Stack(children: [
                Positioned(
                  left: 10 * fem,
                  child: Form(
                    key: _formfield,
                    child: Container(
                        width: 229 * fem,
                        height: 40 * fem,
                        margin: EdgeInsets.fromLTRB(
                            20 * fem, 10 * fem, 0, 0 * fem),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10 * fem),
                            border:
                            Border.all(color: Colors.blue, width: 0.5)),
                        child: TextFormField(
                          controller: controller,
                          readOnly: true,
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 12 * ffem,
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff428adc),
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isDropdown = !isDropdown;
                                  });
                                },
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  color: Colors.blue,
                                  size: 40 * fem,
                                )),
                          ),
                          validator: (input) {
                            if (input!.isEmpty) {
                              return "Please Select Order";
                            }
                            return null;
                          },
                        )),
                  ),
                ),
                Positioned(
                  top: 110 * fem,
                  left: 60 * fem,
                  child: Text(
                    'CHOOSE DATE AND TIME',
                    style: SafeGoogleFont(
                      'Poppins',
                      fontSize: 14 * ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5 * ffem / fem,
                      color: const Color(0xff428adc),
                    ),
                  ),
                ),

                Positioned(
                  //Date
                  top: 160 * fem,
                  left: 8 * fem,
                  child: ElevatedButton(
                    onPressed: () async {
                      final date = await pickDate();
                      if (date == null) return;
                      setState(() {
                        dateTime = date;
                        dateFinal = "${dateTime.year}-${dateTime.month}-${dateTime.day}";
                      });
                    },
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all(const Color(0xff428adc)),
                      // side: getBorder(Color(0xff428adc)),
                      minimumSize: MaterialStateProperty.all(
                          Size(128 * fem, 40 * fem)),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36 * fem),
                        ),
                      ),
                    ),
                    child: Text(
                      '${dateTime.year}-${dateTime.month}-${dateTime.day}',
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.4 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  //Time
                  top: 160 * fem,
                  left: 150 * fem,
                  child: ElevatedButton(
                    onPressed: () {
                      _selectTime(context);
                    },
                    style: ButtonStyle(
                      foregroundColor:
                      MaterialStateProperty.all(Colors.white),
                      backgroundColor:
                      MaterialStateProperty.all(const Color(0xff428adc)),
                      // side: getBorder(Color(0xff428adc)),
                      minimumSize: MaterialStateProperty.all(
                          Size(128 * fem, 40 * fem)),
                      shape:
                      MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36 * fem),
                        ),
                      ),
                    ),
                    child: Text(
                      _buttonText,
                      textAlign: TextAlign.center,
                      style: SafeGoogleFont(
                        'Poppins',
                        fontSize: 13 * ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.4 * ffem / fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),
                ),
                isDropdown
                    ? Positioned(
                  // options menu
                  top: 50 * fem,
                  left: 10 * fem,
                  child: Container(
                    width: 229 * fem,
                    height: 110 * fem,
                    margin: EdgeInsets.only(left: 20 * fem, top: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10 * fem),
                        color: Colors.blue,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 1),
                          )
                        ]),
                    child: ListView.builder(
                        padding: const EdgeInsets.only(top: 0),
                        itemCount: orders.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              GestureDetector(
                                child: ListTile(
                                  title: Text(
                                    orders[index],
                                    style: SafeGoogleFont(
                                      'Poppins',
                                      fontSize: 14 * ffem,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    controller.text = orders[index];
                                    isDropdown = false;
                                  });
                                },
                              ),
                              if (index < orders.length - 1)
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10 * fem),
                                  child: const Divider(
                                    color: Colors.white,
                                    thickness: 1,
                                  ),
                                ),
                            ],
                          );
                        }),
                  ),
                )
                    : const SizedBox(),
              ]),
            ),
            SizedBox(
              height: 40 * fem,
            ),
            Row(
              children: [
                SizedBox(
                  width: 40*fem,
                ),
                Text('Name',
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

                    controller: nameController,
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
                  width:38*fem,
                ),
                Text('Phone',
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
                    keyboardType: TextInputType.phone,
                    onTap: (){

                    },
                    controller: phoneController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10*fem),
                      ) ,

                    ),
                  ),
                ),
              ],
            ),

            Row(
              children: [
                Container(
                    width: 82 * fem,
                    height: 36 * fem,
                    margin: EdgeInsets.only(top: 70 * fem, left: 25 * fem),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(
                            context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xff428adc),
                          side: const BorderSide(
                              color: Color(0xff428adc), width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      child: Text(
                        'CANCEL',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 11 * ffem,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff428adc),
                        ),
                      ),
                    )),
                SizedBox(
                  width: 70 * fem,
                ),
                Container(
                    width: 82 * fem,
                    height: 36 * fem,
                    margin: EdgeInsets.only(
                      top: 70 * fem,
                    ),
                    child: ElevatedButton(
                      onPressed: () {
                        if (controller.text.isEmpty) {
                          Fluttertoast.showToast(
                            msg: "please select a place",
                            backgroundColor: Colors.red,
                            gravity: ToastGravity.BOTTOM,
                            textColor: Colors.white,
                          );
                        }
                        if (controller.text == orders[0]) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PassTansSec(nameController.text,phoneController.text,dateFinal,_buttonText,controller.text)));
                        }
                        else{
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PassTansSec(nameController.text,phoneController.text,dateFinal,_buttonText,controller.text)));
                        }

                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: const Color(0xff428adc),
                          side: const BorderSide(
                              color: Color(0xff428adc), width: 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                      child: Text(
                        'NEXT',
                        style: SafeGoogleFont(
                          'Poppins',
                          fontSize: 11 * ffem,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff428adc),
                        ),
                      ),
                    ))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
