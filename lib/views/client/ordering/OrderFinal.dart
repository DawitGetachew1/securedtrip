import 'package:flutter/material.dart';
import 'package:strong_security/views/client/dashboard/clientDashboard.dart';
import 'dart:ui';

import '../../../utils.dart';

class OrderFinal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Container(
          // customerorderp3eHm (5:4602)
          padding: EdgeInsets.fromLTRB(50*fem, 124*fem,50*fem, 124*fem),
          width: double.infinity,
          decoration: BoxDecoration (
            color: Color(0xffffffff),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                // group3291MCB (5:4608)
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 48*fem),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroupihn7sgK (NSCTV4TwU75XFoxR6LihN7)
                      height: 60*fem,
                      width: 60*fem,
                      decoration: BoxDecoration (
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'images/images/ellipse-181.png',

                          ),
                        ),
                      ),
                      child: Center(
                        // path10740N7H (5:4607)
                        child: SizedBox(
                          width: 46.18*fem,
                          height: 26.57*fem,
                          child: Image.asset(
                            'images/images/path-10740.png',
                            width: 46.18*fem,
                            height: 26.57*fem,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      // thankyougtf (5:4603)
                      margin: EdgeInsets.fromLTRB(8.17*fem, 0*fem, 0*fem, 10*fem),
                      child: Text(
                        'Thank You ',
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 17*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: Color(0xff428adc),
                        ),
                      ),
                    ),
                    Container(
                      // youcanreceiveinformationabouty (5:4604)
                      // constraints: BoxConstraints (
                      //   maxWidth: double.infinity,
                      // ),
                      child: Text(
                        'You can Receive information \nabout your order \nsoon in your Email \naccount ',
                        textAlign: TextAlign.center,
                        style: SafeGoogleFont (
                          'Poppins',
                          fontSize: 11*ffem,
                          fontWeight: FontWeight.w400,
                          height: 1.5*ffem/fem,
                          color: Color(0xff428adc),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.83*fem, 0*fem),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(
                        context, MaterialPageRoute(
                        builder: (context)=> ClientDashboard()
                    ));
                  },
                  style:
                  ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(const Color(0xff428adc)),
                    // side: getBorder(Color(0xff428adc)),
                    minimumSize: MaterialStateProperty.all(Size(160*fem, 35*fem)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(36*fem),
                      ),

                    ),
                  ),

                  child: Text(
                    'DONE',
                    textAlign: TextAlign.center,
                    style:  SafeGoogleFont (
                      'Segoe UI',
                      fontSize: 16*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.4*ffem/fem,
                      color: const Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}