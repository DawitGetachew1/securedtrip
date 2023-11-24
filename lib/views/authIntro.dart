import 'package:flutter/material.dart';

import 'package:strong_security/utils.dart';
import 'package:strong_security/views/passenger/passForm.dart';

import 'signupIntro.dart';

import 'loginIntro.dart';

class AuthenticationIntro extends StatelessWidget {
  const AuthenticationIntro({super.key});


  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        //
        padding: EdgeInsets.fromLTRB(46*fem, 85*fem, 46*fem, 78*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // ellipse-out
              margin: EdgeInsets.fromLTRB(42*fem, 0*fem, 42*fem, 25*fem),
              width: double.infinity,
              height: 144*fem,
              decoration: BoxDecoration (
                border: Border.all(color: const Color(0xff428adc)),
                borderRadius: BorderRadius.circular(72*fem),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // ellipse-in
                    left: 15*fem,
                    top: 15*fem,
                    child: Align(
                      child: SizedBox(
                        width: 114*fem,
                        height: 114*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(57*fem),
                            color: const Color(0xff428adc),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // security img
                    left: 31*fem,
                    top: 31*fem,
                    child: Align(
                      child: SizedBox(
                        width: 82*fem,
                        height: 82*fem,
                        child: Image.asset(
                          'images/images/security-noh.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(30*fem, 40*fem, 30*fem, 12*fem),

              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context)=> const LoginIntro()
                  ));
                },
                style:
                ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(const Color(0xff428adc)),
                  // side: getBorder(Color(0xff428adc)),
                  minimumSize: MaterialStateProperty.all(Size(168*fem, 34*fem)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36*fem),
                    ),

                  ),
                ),

                child: Text(
                  'LOGIN',
                  textAlign: TextAlign.center,
                  style:  SafeGoogleFont (
                    'Poppins',
                    fontSize: 17*ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.4*ffem/fem,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
            Container(
              // group rec1 and rec2
              margin: EdgeInsets.fromLTRB(30*fem, 3*fem, 30*fem, 12*fem),

              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context)=> const SignUpIntro()
                  ));
                },
                style:
                ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(const Color(0xff428adc)),
                  // side: getBorder(Color(0xff428adc)),
                  minimumSize: MaterialStateProperty.all(Size(168*fem, 34*fem)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36*fem), // Adjust the corner radius as needed
                    ),
                  ),
                ),

                child: Text(
                  'SIGN UP',
                  textAlign: TextAlign.center,
                  style:  SafeGoogleFont (
                    'Poppins',
                    fontSize: 17*ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.4*ffem/fem,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),

            ),
            Container(
              // group rec1 and rec2
              margin: EdgeInsets.fromLTRB(30*fem, 3*fem, 30*fem, 12*fem),

              child: ElevatedButton(
                onPressed: (){
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context)=> PassOrder()
                  ));
                },
                style:
                ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(const Color(0xff428adc)),
                  // side: getBorder(Color(0xff428adc)),
                  minimumSize: MaterialStateProperty.all(Size(168*fem, 34*fem)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(36*fem), // Adjust the corner radius as needed
                    ),
                  ),
                ),

                child: Text(
                  'ONE TIME REQUEST',
                  textAlign: TextAlign.center,
                  style:  SafeGoogleFont (
                    'Poppins',
                    fontSize: 14*ffem,
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
    );
  }
}