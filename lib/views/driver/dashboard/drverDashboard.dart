import 'dart:convert';
import 'dart:ui';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:strong_security/model/notification.dart';

import '../../../api_connection/api_connection.dart';
import '../../../model/driver.dart';
import '../../../utils.dart';
import '../../authIntro.dart';
import '../sharedPreference/current_preference.dart';
import 'package:http/http.dart' as http;
import '../sharedPreference/driverPreference.dart';

class DriverDashboard extends StatefulWidget {

  DriverDashboard();

  @override
  State<DriverDashboard> createState() => _DriverDashboardState();
}

class _DriverDashboardState extends State<DriverDashboard> {


  CurrentDriver _rememberCurrentDriver = Get.put(CurrentDriver());

  bool _isSidebarOpen = false;

  void _toggleSidebar() {

    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
  }
  List<String> toggleButtonNames = [
    'Available',
    'On Route',
    'Unavailable',
  ];
  List<bool> isSelected = [false,false,false];
  void _updateToggleValue( String selectedName) async {
    Driver? driver = await RememberDriverPref.readDriverInfo();
    final response = await http.post(
      Uri.parse(API.updateToggle),
      body: {
        'toggleName': selectedName,
        'id': driver!.did.toString()
      },
    );

    if (response.statusCode == 200) {

    } else {
      Fluttertoast.showToast(
        msg: "Error Updating",
        backgroundColor: Colors.red,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white,
      );
    }
    final responseToggle = await http.get(Uri.parse('${API.getToggle}?id=${driver!.did.toString()}'));
    if (responseToggle.statusCode == 200) {
      createNotification(responseToggle.body);
    } else {
      print('Error: ${responseToggle.statusCode}');
    }
  }
  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Allow Notifications'),
            content: Text('Our App would like to send you notifications'),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Don\'t Allow',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 18,
                    ),
                  )),
              TextButton(
                  onPressed: () {
                    AwesomeNotifications()
                        .requestPermissionToSendNotifications()
                        .then((_) => Navigator.pop(context));
                  },
                  child: Text(
                    'Allow',
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        );
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return WillPopScope(
      onWillPop:  () async {

        SystemNavigator.pop();

        return true; // Allow the app to exit
      },
      child: GetBuilder(
        init: CurrentDriver(),
        initState: (currentState){
          _rememberCurrentDriver.getDriverInfo();
        },
        builder: (controller) {
          return SafeArea(
            child: Scaffold(
              body: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white
                ),
                child: Stack(
                    children:[
                      SingleChildScrollView(
                          child: SizedBox(
                              width: double.infinity,
                              child: Container(
                                // clientdashboardWnj (5:4456)
                                  width: double.infinity,
                                  decoration: const BoxDecoration (
                                    color: Color(0xffffffff),
                                  ),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          // autogroupjaw9e8F (NSCNUY9MfXCTjnpR4UJaw9)
                                          width: double.infinity,
                                          height: 350*fem,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // group3277Na3 (5:4473)
                                                left: 37*fem,
                                                top: 57*fem,
                                                child: SizedBox(
                                                  width: 110.13*fem,
                                                  height: 36*fem,
                                                  child: Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        // group3276h6X (5:4472)
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 7.13*fem, 0*fem),
                                                        width: 35*fem,
                                                        height: double.infinity,
                                                        child: Stack(
                                                          children: [
                                                            // image and circle
                                                            Positioned(
                                                              left: 2*fem,
                                                              top: 3*fem,
                                                              child: Align(
                                                                child: SizedBox(
                                                                  width: 31*fem,
                                                                  height: 30*fem,
                                                                  child: Image.asset(
                                                                    'images/images/mask-group-5.png',
                                                                    width: 31*fem,
                                                                    height: 30*fem,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              // ellipse180inK (5:4458)
                                                              left: 0*fem,
                                                              top: 0*fem,
                                                              child: Align(
                                                                child: SizedBox(
                                                                  width: 35*fem,
                                                                  height: 36*fem,
                                                                  child: Image.asset(
                                                                    'images/images/ellipse-180-e2j.png',
                                                                    width: 35*fem,
                                                                    height: 36*fem,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      //welcome admin
                                                      Container(
                                                        margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 1*fem),
                                                        child: RichText(
                                                          textAlign: TextAlign.center,
                                                          text: TextSpan(
                                                            style: SafeGoogleFont (
                                                              'Poppins',
                                                              fontSize: 8*ffem,
                                                              fontWeight: FontWeight.w700,
                                                              height: 1.375*ffem/fem,
                                                              color: const Color(0xff000000),
                                                            ),
                                                            children: [
                                                              TextSpan(
                                                                text: 'WELCOME ',
                                                                style: SafeGoogleFont (
                                                                  'Poppins',
                                                                  fontSize: 8*ffem,
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 1.375*ffem/fem,
                                                                  color: const Color(0xff428adc),
                                                                ),
                                                              ),
                                                              TextSpan(
                                                                text: 'ADMIN',
                                                                style: SafeGoogleFont (
                                                                  'Poppins',
                                                                  fontSize: 8*ffem,
                                                                  fontWeight: FontWeight.w700,
                                                                  height: 1.375*ffem/fem,
                                                                  color: const Color(0xff000000),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              //horizontal line
                                              Positioned(
                                                left: 12.5*fem,
                                                top: 114.5*fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 295*fem,
                                                    height: 1*fem,
                                                    child: Container(
                                                      decoration: const BoxDecoration (
                                                        color: Color(0xff428adc),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),

                                              Positioned(
                                                // menu button
                                                left: 250.2001953125*fem,
                                                top: 55*fem,
                                                child: FloatingActionButton(
                                                  mini: true,
                                                  onPressed: _toggleSidebar,
                                                  child: const Icon(Icons.menu),
                                                ),
                                              ),

                                              Positioned(
                                                // menu button
                                                left: 40*fem,
                                                top: 300*fem,
                                                child:   ToggleButtons(
                                                  isSelected: isSelected,
                                                  selectedColor: Colors.white,
                                                  color:  Color(0xff428adc),
                                                  fillColor: Color(0xff428adc),
                                                  borderColor: Colors.lightBlue.shade900,
                                                  children: <Widget>[
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10*fem),
                                                      child: Text('Available',
                                                        style: SafeGoogleFont (
                                                          'Poppins',
                                                          fontSize: 11*ffem,
                                                          fontWeight: FontWeight.w700,
                                                        ),),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10*fem),
                                                      child: Text('On Route', style: SafeGoogleFont (
                                                        'Poppins',
                                                        fontSize: 11*ffem,
                                                        fontWeight: FontWeight.w700,

                                                      ),),
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.symmetric(horizontal: 10*fem),
                                                      child: Text('Unavailable', style: SafeGoogleFont (
                                                        'Poppins',
                                                        fontSize: 11*ffem,
                                                        fontWeight: FontWeight.w700,

                                                      ),),
                                                    ),
                                                  ],
                                                  onPressed: (int newIndex){
                                                    setState(() {
                                                      for (int index = 0; index<isSelected.length; index++){
                                                        if(index == newIndex){
                                                          isSelected[index]= true;
                                                        }
                                                        else{
                                                          isSelected[index] = false;
                                                        }
                                                      }

                                                      String selectedName = toggleButtonNames[newIndex];
                                                      _updateToggleValue(selectedName);


                                                    });
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ]
                                  )
                              )
                          )
                      ),
                      if (_isSidebarOpen)
                        BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3), // Adjust blur as needed
                          child: Container(
                            color: Colors.black.withOpacity(0.5), // Semi-transparent black background
                          ),
                        ),

                      AnimatedPositioned(
                        // Sidebar menu
                        duration: const Duration(milliseconds: 300),
                        top:0,
                        right:_isSidebarOpen?0: -152*fem,
                        child: Container(
                          width: 152*fem,
                          height: MediaQuery.of(context).size.height,
                          // height: ,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Color(0xff428adc),
                                Color(0xffdfeaf8),
                              ],
                            ),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 0,
                                  top: 0*fem,
                                  child: SizedBox(

                                      width: 50*fem,
                                      height: 50*fem,
                                      child: TextButton(
                                        onPressed: (){
                                          setState(() {
                                            _isSidebarOpen=false;
                                          });
                                        },
                                        child: const Icon(Icons.close,
                                          color: Colors.white,
                                          size: 40,
                                        ),
                                      )
                                  )),
                              Positioned(
                                  top: 220*fem,
                                  left: 20*fem,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.fromLTRB(0*fem, 20*fem, 0, 0*fem),
                                        child: ElevatedButton(
                                          onPressed: ()
                                          {
                                            RememberDriverPref.removeDriverInfo().then((value) =>
                                                Get.off(AuthenticationIntro())
                                            );
                                          },
                                          style:
                                          ButtonStyle(
                                            foregroundColor: MaterialStateProperty.all(const Color(0xff428adc)),
                                            backgroundColor: MaterialStateProperty.all(Colors.white),
                                            // side: getBorder(Color(0xff428adc)),
                                            minimumSize: MaterialStateProperty.all(Size(118*fem, 40*fem)),
                                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                              RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0), // Adjust the corner radius as needed
                                              ),
                                            ),
                                          ),

                                          child: Text(
                                            'LOGOUT',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont (
                                              'Poppins',
                                              fontSize: 13*ffem,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ))
                            ],
                          ),

                        ),
                      ),
                    ]
                ),
              ),
            ),
          );
        },
      ),
    );

  }
}