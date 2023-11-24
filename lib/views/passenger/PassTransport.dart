import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:strong_security/views/client/ordering/OrderFinal.dart';

import '../../../api_connection/api_connection.dart';
import '../../../utils.dart';
import 'package:http/http.dart' as http;
class PassTransport extends StatefulWidget {
  String name;
  String phone;
  String date;
  String time;
  String transType;
  PassTransport(this.name, this.phone,this.date,this.time,this.transType);

  @override
  State<PassTransport> createState() => _PassTransportState();
}

class _PassTransportState extends State<PassTransport> {
  final _formfield = GlobalKey<FormState>();
  bool startDropdown = false;
  bool endDropdown = false;
  bool seatDropdown = false;
  TextEditingController startController = TextEditingController();
  TextEditingController endController = TextEditingController();
  TextEditingController seatController = TextEditingController();
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  ScrollController scrollController3 = ScrollController();

  List<String> places = [
    'Addis Ketema ',
    'Akaky Kaliti ',
    'Arada',
    'Bole',
    'Gullele',
    'Kirkos',
    'Kolfe Keranio',
    'Lideta',
    'Nifas Silk-Lafto',
    'Yeka',
    'Lemi kura'
  ];
  List<String> seats = [
    '4',
    '7',
    '12'

  ];
  saveTransportInfo() async {
    var response = await http.post(
      Uri.parse(API.transportClient),
      body: {
        "name": widget.name,
        "phone": widget.phone,
        "date": widget.date,
        "time": widget.time,
        "startPlace": startController.text.trim(),
        "endPlace": endController.text.trim(),
        "transType": widget.transType,
        "seats":  seatController.text.trim()
      },);

    try {
      if (response.statusCode == 200) {
        var resBodyOfTransport = jsonDecode(response.body);

        if (resBodyOfTransport['success']) {
          Fluttertoast.showToast(msg: "Request Sent Successfully");
          Future<void>.delayed(Duration(seconds: 1), () {
            Get.to(() => OrderFinal());
          });
        } else {
          Fluttertoast.showToast(msg: "An error occurred");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: SingleChildScrollView(
          child:Container(
              margin: EdgeInsets.only(
                top: 65 * fem,
              ),
              child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(bottom: 40 * fem),
                      child: Center(
                        child: Text(
                          'CHOOSE YOUR LOCATION',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 17 * ffem,
                            fontWeight: FontWeight.w700,
                            height: 1.5 * ffem / fem,
                            color: const Color(0xff428adc),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 425 * fem,
                      width: double.infinity,
                      child: Form(
                        key: _formfield,
                        child: Stack(
                          children: [
                            Positioned(
                                left: 15 * fem,
                                top: 10*fem,
                                child: Container(
                                  height: 40 * fem,
                                  width: 60 *fem,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10 * fem),
                                      color: Colors.blue
                                  ),
                                  child: Align(
                                    child: Text(
                                      'FROM',
                                      style: SafeGoogleFont (
                                          'Poppins',

                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                )),
                            Positioned(
                              left: 65 * fem,
                              child: Container(
                                  width: 209 * fem,
                                  height: 40 * fem,
                                  margin:
                                  EdgeInsets.fromLTRB(20 * fem, 10 * fem, 0, 0 * fem),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10 * fem),
                                      border: Border.all(color: Colors.blue, width: 0.5)),
                                  child: TextFormField(
                                    controller: startController,
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
                                              startDropdown = !startDropdown;
                                            });
                                          },
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.blue,
                                            size: 40 * fem,
                                          )),
                                      contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                                    ),
                                    validator: (input){
                                      if(input!.isEmpty){
                                        return "Please your location";
                                      }
                                      return null;

                                    },
                                  )),
                            ),
                            Positioned(
                                left: 95 * fem,
                                top:  60*fem,
                                child: Container(
                                    child: Image.asset(
                                      'images/images/tranic.png',
                                      width: 150 * fem,
                                      height: 150 * fem,
                                      fit: BoxFit.cover,
                                    ))
                            ),

                            Positioned(
                                left: 15 * fem,
                                top: 200*fem,
                                child: Container(
                                  height: 40 * fem,
                                  width: 60 *fem,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10 * fem),
                                      color: Colors.blue
                                  ),
                                  child: Align(
                                    child: Text(
                                      'TO',
                                      style: SafeGoogleFont (
                                          'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                )),

                            //additional seat button start

                            Positioned(
                                left: 15 * fem,
                                top: 270*fem,
                                child: Container(
                                  height: 40 * fem,
                                  width: 60 *fem,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10 * fem),
                                      color: Colors.blue
                                  ),
                                  child: Align(
                                    child: Text(
                                      'Seat',
                                      style: SafeGoogleFont (
                                          'Poppins',
                                          fontWeight: FontWeight.w600,
                                          color: Colors.white
                                      ),
                                    ),
                                  ),
                                )),

                            Positioned(
                              left: 65 * fem,
                              top: 260* fem,
                              child: Container(
                                  width: 209 * fem,
                                  height: 40 * fem,
                                  margin:
                                  EdgeInsets.fromLTRB(20 * fem, 10 * fem, 0, 0 * fem),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10 * fem),
                                      border: Border.all(color: Colors.blue, width: 0.5)),
                                  child: TextFormField(
                                    controller: seatController,
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
                                              seatDropdown = !seatDropdown;
                                            });
                                          },
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.blue,
                                            size: 40 * fem,
                                          )),
                                      contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                                    ),
                                    validator: (input){
                                      if(input!.isEmpty){
                                        return "Please your location";
                                      }
                                      return null;

                                    },
                                  )),
                            ),

                            seatDropdown
                                ? Positioned(
                              // options menu
                              top: 260 * fem,
                              left: 65 * fem,
                              child: Container(
                                width: 209 * fem,
                                height: 155 * fem,
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
                                child: Scrollbar(
                                  thumbVisibility: true,
                                  controller: scrollController3,

                                  child: ListView.builder(
                                      controller: scrollController3,
                                      padding: const EdgeInsets.only(top: 0),
                                      itemCount: seats.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            GestureDetector(
                                              child: ListTile(
                                                title: Text(
                                                  seats[index],
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  seatController.text = seats[index];
                                                  seatDropdown = false;
                                                });
                                              },
                                            ),
                                            if (index < seats.length - 1)
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

                              ),

                            )














                            //additional seat button end













                                : const SizedBox(),











                            Positioned(
                              left: 65 * fem,
                              top: 190* fem,
                              child: Container(
                                  width: 209 * fem,
                                  height: 40 * fem,
                                  margin:
                                  EdgeInsets.fromLTRB(20 * fem, 10 * fem, 0, 0 * fem),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10 * fem),
                                      border: Border.all(color: Colors.blue, width: 0.5)),
                                  child: TextFormField(
                                    controller: endController,
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
                                              endDropdown = !endDropdown;
                                            });
                                          },
                                          child: Icon(
                                            Icons.arrow_drop_down,
                                            color: Colors.blue,
                                            size: 40 * fem,
                                          )),
                                      contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                                    ),
                                    validator: (input){
                                      if(input!.isEmpty){
                                        return "Please your location";
                                      }
                                      return null;

                                    },
                                  )),
                            ),
                            startDropdown
                                ? Positioned(
                              // options menu
                              top: 50 * fem,
                              left: 65 * fem,
                              child: Container(
                                width: 209 * fem,
                                height: 155 * fem,
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
                                child: Scrollbar(
                                  thumbVisibility: true,
                                  controller: scrollController1,

                                  child: ListView.builder(
                                      controller: scrollController1,
                                      padding: const EdgeInsets.only(top: 0),
                                      itemCount: places.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            GestureDetector(
                                              child: ListTile(
                                                title: Text(
                                                  places[index],
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  startController.text = places[index];
                                                  startDropdown = false;
                                                });
                                              },
                                            ),
                                            if (index < places.length - 1)
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
                              ),
                            )
                                : const SizedBox(),
                            Positioned(
                              top: 310 * fem,
                              child: Row(
                                children: [
                                  Container(
                                      width: 82 * fem,
                                      height: 36 * fem,
                                      margin: EdgeInsets.only(top: 70 * fem, left: 40 * fem),
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
                                          'BACK',
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
                                          if ((startController.text.isEmpty||endController.text.isEmpty)||(startController.text.isEmpty&&endController.text.isEmpty)) {
                                            Fluttertoast.showToast(
                                              msg: "please select a place",
                                              backgroundColor: Colors.red,
                                              gravity: ToastGravity.BOTTOM,
                                              textColor: Colors.white,
                                            );
                                          } else {
                                            //saveTransportInfo();
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
                            ),
                            endDropdown
                                ? Positioned(
                              // options menu
                              top: 240 * fem,
                              left: 65 * fem,
                              child: Container(
                                width: 209 * fem,
                                height: 155 * fem,
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
                                child: Scrollbar(
                                  thumbVisibility: true,
                                  controller: scrollController2,
                                  child: ListView.builder(
                                      controller: scrollController2,
                                      padding: const EdgeInsets.only(top: 0),
                                      itemCount: places.length,
                                      itemBuilder: (context, index) {
                                        return Column(
                                          children: [
                                            GestureDetector(
                                              child: ListTile(
                                                title: Text(
                                                  places[index],
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 12 * ffem,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              onTap: () {
                                                setState(() {
                                                  endController.text = places[index];
                                                  endDropdown = false;
                                                });
                                              },
                                            ),
                                            if (index < places.length - 1)
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
                              ),
                            )
                                : const SizedBox(),

                          ],
                        ),
                      ),
                    ),


                  ]
              )
          ),
        ));
  }
}
