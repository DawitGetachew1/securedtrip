import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:strong_security/views/client/ordering/OrderFinal.dart';
import 'package:strong_security/views/client/ordering/transportClient.dart';
import 'package:strong_security/views/client/userPreferences/user_preferences.dart';

import '../../../api_connection/api_connection.dart';
import '../../../model/user.dart';
import '../../../utils.dart';
import '../dashboard/clientDashboard.dart';
import 'transportSecurity.dart';
import 'package:http/http.dart' as http;
class ClientOrder extends StatefulWidget {
  const ClientOrder({super.key});

  @override
  State<ClientOrder> createState() => _ClientOrderState();
}

class _ClientOrderState extends State<ClientOrder> {
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
    'SECURITY',
    'TRANSPORT AND SECURITY',
  ];
  final _formfield = GlobalKey<FormState>();
  TimeOfDay? _selectedTime;
  String _buttonText = '12:00 PM';
  SaveSecurityInfo() async {
    User? user = await RememberUserPref.readUserInfo();

    var response = await http.post(
      Uri.parse(API.securityClient),
      body: {
        "email": user!.cEmail,
        "date": dateFinal,
        "time": _buttonText,
      },);

    try {
      print(response.body);
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
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // decoration: BoxDecoration(
          //   shape: BoxShape.rectangle,
          //   color: Colors.blue
          // ),
          margin: EdgeInsets.only(
            top: 65 * fem,
          ),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 40 * fem),
                child: Center(
                  child: Text(
                    'CUSTOMER ORDERING PAGE',
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
                    left: 25 * fem,
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
                    top: 100 * fem,
                    left: 75 * fem,
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
                    top: 140 * fem,
                    left: 20 * fem,
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
                    top: 140 * fem,
                    left: 160 * fem,
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
                          left: 25 * fem,
                          child: Container(
                            width: 229 * fem,
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
                height: 10 * fem,
              ),

              Row(
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
                                       TransportClient(dateFinal,_buttonText)));
                          }
                         else if (controller.text == orders[2]) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        TransportSecurity(dateFinal,_buttonText)));
                          }
                         else{
                            SaveSecurityInfo();
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
