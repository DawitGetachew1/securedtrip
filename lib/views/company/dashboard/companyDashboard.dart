import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:strong_security/utils.dart';
import 'package:strong_security/views/authIntro.dart';
import 'package:strong_security/views/company/authentication/login/loginCompany.dart';
import 'package:strong_security/views/company/humanResource/HRManger.dart';

import '../companyPreferences/company_preferences.dart';
import '../companyPreferences/current_company.dart';
import 'package:get/get.dart';
class CompanyDashboard extends StatefulWidget {
  const CompanyDashboard({super.key});

  @override
  State<CompanyDashboard> createState() => _CompanyDashboardState();
}

class _CompanyDashboardState extends State<CompanyDashboard> {
  CurrentCompany _rememberCurrentCompany = Get.put(CurrentCompany());
  bool _isSidebarOpen = false;
  MaterialStateProperty<Size> getSize(){
    getSize(Set<MaterialState>states) {
      return const Size(100, 100);

    }
    return MaterialStateProperty.resolveWith(getSize);
  }
  MaterialStateProperty<Color> getColor(Color color, Color colorPressed){
    getColor(Set<MaterialState>states){
      if(states.contains(MaterialState.pressed)){
        return colorPressed;
      }

      else {
        return color;
      }
    }
    return MaterialStateProperty.resolveWith(getColor);
  }
  MaterialStateProperty<BorderSide> getBorder(Color color){
    getBorder(Set<MaterialState>states){

      return BorderSide(color: color,width: 2);
    }
    return MaterialStateProperty.resolveWith(getBorder);
  }

  void _toggleSidebar() {
    setState(() {
      _isSidebarOpen = !_isSidebarOpen;
    });
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
        init: CurrentCompany(),
    initState: (currentState){
    _rememberCurrentCompany.getCompanyInfo();
    },
    builder: (controller) {
      return SafeArea(
        child: Scaffold(
          body: Stack(
              children: [
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
                            height: 220 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // group3277Na3 (5:4473)
                                  left: 37 * fem,
                                  top: 57 * fem,
                                  child: SizedBox(
                                    width: 110.13 * fem,
                                    height: 36 * fem,
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .center,
                                      children: [
                                        Container(
                                          // group3276h6X (5:4472)
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem, 7.13 * fem,
                                              0 * fem),
                                          width: 35 * fem,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              // image and circle
                                              Positioned(
                                                left: 2 * fem,
                                                top: 3 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 31 * fem,
                                                    height: 30 * fem,
                                                    child: Image.asset(
                                                      'images/images/mask-group-5.png',
                                                      width: 31 * fem,
                                                      height: 30 * fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // ellipse180inK (5:4458)
                                                left: 0 * fem,
                                                top: 0 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 35 * fem,
                                                    height: 36 * fem,
                                                    child: Image.asset(
                                                      'images/images/ellipse-180-e2j.png',
                                                      width: 35 * fem,
                                                      height: 36 * fem,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        //welcome admin
                                        Container(
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem, 0 * fem,
                                              1 * fem),
                                          child: RichText(
                                            textAlign: TextAlign.center,
                                            text: TextSpan(
                                              style: SafeGoogleFont(
                                                'Poppins',
                                                fontSize: 8 * ffem,
                                                fontWeight: FontWeight.w700,
                                                height: 1.375 * ffem / fem,
                                                color: const Color(0xff000000),
                                              ),
                                              children: [
                                                TextSpan(
                                                  text: 'WELCOME ',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 8 * ffem,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.375 * ffem / fem,
                                                    color: const Color(
                                                        0xff428adc),
                                                  ),
                                                ),
                                                TextSpan(
                                                  text: 'ADMIN',
                                                  style: SafeGoogleFont(
                                                    'Poppins',
                                                    fontSize: 8 * ffem,
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.375 * ffem / fem,
                                                    color: const Color(
                                                        0xff000000),
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
                                  left: 12.5 * fem,
                                  top: 114.5 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 295 * fem,
                                      height: 1 * fem,
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
                                  left: 250.2001953125 * fem,
                                  top: 55 * fem,
                                  child: FloatingActionButton(
                                    mini: true,
                                    onPressed: _toggleSidebar,
                                    child: const Icon(Icons.menu),
                                  ),
                                ),

                                Positioned(
                                  left: 40.8149414062 * fem,
                                  top: 145 * fem,
                                  child: Container(

                                    width: 250.92 * fem,
                                    height: 100 * fem,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          9 * fem),
                                    ),
                                    child: Row(
                                      crossAxisAlignment: CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          // group3278Ugw (5:4474)
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem, 40 * fem,
                                              0 * fem),
                                          width: 40 * fem,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                9 * fem),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                // rectangle2121zvB (5:4460)
                                                margin: EdgeInsets.fromLTRB(
                                                    3.19 * fem, 0 * fem,
                                                    3.81 * fem, 2 * fem),
                                                width: 50 * fem,
                                                height: 28 * fem,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(9 * fem),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xff428adc)),
                                                ),
                                              ),
                                              Text(
                                                // emp8Fh (5:4461)
                                                '22 EMP',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 2 * ffem / fem,
                                                  color: const Color(
                                                      0xff428adc),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // group3279fWX (5:4475)
                                          margin: EdgeInsets.fromLTRB(
                                              0 * fem, 0 * fem, 34.92 * fem,
                                              0 * fem),
                                          width: 70 * fem,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                9 * fem),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                // rectangle2121b9H (5:4462)
                                                margin: EdgeInsets.fromLTRB(
                                                    14.19 * fem, 1.2 * fem,
                                                    14.81 * fem, 9 * fem),
                                                width: 32 * fem,
                                                height: 28 * fem,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(9 * fem),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xff428adc)),
                                                ),
                                              ),
                                              Text(
                                                // etbshy1 (5:4463)
                                                '2500 ETB. S',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 1 * ffem / fem,
                                                  color: const Color(
                                                      0xff428adc),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // group3280Svb (5:4476)
                                          width: 65 * fem,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                                9 * fem),
                                          ),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .center,
                                            children: [
                                              Container(
                                                // rectangle2121nDm (5:4464)
                                                margin: EdgeInsets.fromLTRB(
                                                    16.27 * fem, 1.5 * fem,
                                                    16.73 * fem, 1.5 * fem),
                                                width: 31 * fem,
                                                height: 28 * fem,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(9 * fem),
                                                  border: Border.all(
                                                      color: const Color(
                                                          0xff428adc)),
                                                ),
                                              ),
                                              Text(
                                                // i7R (5:4465)
                                                '1500/10,000',
                                                textAlign: TextAlign.center,
                                                style: SafeGoogleFont(
                                                  'Poppins',
                                                  fontSize: 10 * ffem,
                                                  fontWeight: FontWeight.w700,
                                                  height: 2 * ffem / fem,
                                                  color: const Color(
                                                      0xff428adc),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),


                              ],
                            ),
                          ),
                          Container(
                            // autogrouptgvtw8b (NSCNL8Di1B4Wp6LxpWtGvT)
                            padding: EdgeInsets.fromLTRB(
                                34.23 * fem, 10 * fem, 33.77 * fem, 3 * fem),
                            width: double.infinity,
                            decoration: const BoxDecoration (
                              gradient: LinearGradient(
                                begin: Alignment(1, 1),
                                end: Alignment(-0.974, -0),
                                colors: <Color>[
                                  Color(0xff428adc),
                                  Color(0xffdfeaf8)
                                ],
                                stops: <double>[0, 1],
                              ),
                            ),
                            child: Text(
                              'WIN YOUR POINT',
                              textAlign: TextAlign.center,
                              style: SafeGoogleFont(
                                'Poppins',
                                fontSize: 30 * ffem,
                                fontWeight: FontWeight.w700,
                                height: 1.5 * ffem / fem,
                                color: const Color(0xffffffff),
                              ),
                            ),
                          ),
                          SizedBox(
                            // citationsmotivantesetinspirant (5:4469)
                            width: 321 * fem,
                            height: 482 * fem,
                            child: Image.asset(
                              'images/images/citations-motivantes-et-inspirantes-sophies-way.png',
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                95 * fem, 20 * fem, 0, 20 * fem),
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context) => const HRManager()
                                ));
                              },
                              style:
                              ButtonStyle(

                                foregroundColor: getColor(
                                    const Color(0xff428adc),
                                    const Color(0xffffffff)),
                                backgroundColor: getColor(
                                    const Color(0xffffffff),
                                    const Color(0xff428adc)),
                                side: getBorder(const Color(0xff428adc)),
                                minimumSize: MaterialStateProperty.all(
                                    Size(128 * fem, 32 * fem)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Adjust the corner radius as needed
                                  ),
                                ),
                              ),

                              child: Text(
                                'HUMAN RESOURCE',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(
                                95 * fem, 5 * fem, 0, 20 * fem),
                            child: ElevatedButton(
                              onPressed: () {},
                              style:
                              ButtonStyle(

                                foregroundColor: getColor(
                                    const Color(0xff428adc),
                                    const Color(0xffffffff)),
                                backgroundColor: getColor(
                                    const Color(0xffffffff),
                                    const Color(0xff428adc)),
                                side: getBorder(const Color(0xff428adc)),
                                minimumSize: MaterialStateProperty.all(
                                    Size(128 * fem, 32 * fem)),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        20.0), // Adjust the corner radius as needed
                                  ),
                                ),
                              ),

                              child: Text(
                                'HISTORY',
                                textAlign: TextAlign.center,
                                style: SafeGoogleFont(
                                  'Poppins',
                                  fontSize: 10 * ffem,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                if (_isSidebarOpen)
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                    // Adjust blur as needed
                    child: Container(
                      color: Colors.black.withOpacity(
                          0.5), // Semi-transparent black background
                    ),
                  ),

                AnimatedPositioned(
                  // Sidebar menu
                  duration: const Duration(milliseconds: 300),
                  top: 0,
                  right: _isSidebarOpen ? 0 : -152 * fem,
                  child: Container(
                    width: 152 * fem,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
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
                            top: 0 * fem,
                            child: SizedBox(

                                width: 50 * fem,
                                height: 50 * fem,
                                child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      _isSidebarOpen = false;
                                    });
                                  },
                                  child: const Icon(Icons.close,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                )
                            )),
                        Positioned(
                            top: 60 * fem,
                            left: 20 * fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [

                                Container(
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 20 * fem, 0, 0 * fem),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      RememberCompanyPref.removeCompanyInfo()
                                          .then((value) =>
                                          Get.off(AuthenticationIntro())
                                      );
                                    },
                                    style:
                                    ButtonStyle(
                                      foregroundColor: MaterialStateProperty
                                          .all(const Color(0xff428adc)),
                                      backgroundColor: MaterialStateProperty
                                          .all(Colors.white),
                                      // side: getBorder(Color(0xff428adc)),
                                      minimumSize: MaterialStateProperty.all(
                                          Size(118 * fem, 40 * fem)),
                                      shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              20.0), // Adjust the corner radius as needed
                                        ),
                                      ),
                                    ),

                                    child: Text(
                                      'LOGOUT',
                                      textAlign: TextAlign.center,
                                      style: SafeGoogleFont(
                                        'Poppins',
                                        fontSize: 13 * ffem,
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
      );
        }
      ),
    );

  }
}