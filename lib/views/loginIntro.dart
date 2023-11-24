import 'package:flutter/material.dart';
import 'package:strong_security/utils.dart';
import 'package:strong_security/views/authIntro.dart';
import 'package:strong_security/views/client/authentication/login/loginClient.dart';
import 'package:strong_security/views/company/authentication/login/loginCompany.dart';

import 'driver/login/loginDriver.dart';

class LoginIntro extends StatelessWidget {
  const LoginIntro({super.key});



  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // aW3 (5:4351)
        padding: EdgeInsets.fromLTRB(105.92*fem, 41.64*fem, 122.08*fem, 51.9*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // logingoy (5:4353)
              margin: EdgeInsets.fromLTRB(0*fem, 46*fem, 0*fem, 19.72*fem),
              child:
              RichText(
                text:TextSpan(text: 'LOGIN',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 30*ffem,
                  fontWeight: FontWeight.bold,
                  height: 1.2*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
            ),
            ),
            Container(
              // autogroupmyyjPCb (NSCKaCpBA7qqdRQYKpMyYj)
              margin: EdgeInsets.fromLTRB(6.08*fem, 40*fem, 5.92*fem, 25.61*fem),
              width: double.infinity,
              height: 79.21*fem,
              child: Stack(
                children: [
                  Positioned(
                    // group3217uRq (5:4385)
                    left: 8.0005874634*fem,
                    top: 7.2760009766*fem,
                    child: Container(
                      width: 64*fem,
                      height: 64*fem,
                      decoration: const BoxDecoration (
                        image: DecorationImage (
                          fit: BoxFit.cover,
                          image: AssetImage (
                            'images/images/path-10726.png',
                          ),
                        ),
                      ),
                      child: Center(
                        child: RichText(
                          text: TextSpan(text:'CLIENT',
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 12*ffem,
                            fontWeight: FontWeight.bold,
                            height: 1.2000000212*ffem/fem,
                            color: const Color(0xffffffff),
                          )
                        ),
                      ),
                    ),
                    ),
                  ),
                  Positioned(
                    // group3220xuu (5:4402)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 80*fem,
                        height: 79.21*fem,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context)=> const LoginClient()
                            ));
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'images/images/group-3220.png',
                            width: 80*fem,
                            height: 79.21*fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroupbs8kFu1 (NSCKkcgVdUkAo2ZpiqBs8K)
              margin: EdgeInsets.fromLTRB(6.08*fem, 0*fem, 5.92*fem, 25.61*fem),
              width: double.infinity,
              height: 184.31*fem,
              child: Stack(
                children: [
                  Positioned(
                    // group3235Nyd (5:4399)
                    left: 7.7817230225*fem,
                    top: 7.4564208984*fem,
                    child: SizedBox(
                      width: 64.22*fem,
                      height: 169.41*fem,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // autogroupzank6ej (NSCKvH54Yi7McvDfowzANK)
                            margin: EdgeInsets.fromLTRB(0.22*fem, 0*fem, 0*fem, 41.41*fem),
                            width: double.infinity,
                            height: 64*fem,
                            decoration: const BoxDecoration (
                              image: DecorationImage (
                                fit: BoxFit.cover,
                                image: AssetImage (
                                  'images/images/path-10729.png',
                                ),
                              ),
                            ),
                            child: Center(
                              child: RichText(
                               text:TextSpan(text:'COMPANY',
                                   style: SafeGoogleFont (
                                     'Poppins',
                                     fontSize: 10*ffem,
                                     fontWeight: FontWeight.bold,
                                     height: 1.2000000212*ffem/fem,
                                     color: const Color(0xffffffff),
                                   )
                                ),
                              ),
                            ),
                          ),
                          Container(
                            // autogroupjgw9ZHR (NSCL4SW8MgQFmNreHGjGw9)
                            margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0.22*fem, 0*fem),
                            width: double.infinity,
                            height: 64*fem,
                            decoration: const BoxDecoration (
                              image: DecorationImage (
                                fit: BoxFit.cover,
                                image: AssetImage (
                                  'images/images/path-10730.png',
                                ),
                              ),
                            ),
                            child: Center(
                              child: RichText(
                                text:TextSpan(text:'DRIVER',
                                    style: SafeGoogleFont (
                                      'Poppins',
                                      fontSize: 12*ffem,
                                      fontWeight: FontWeight.bold,
                                      height: 1.2000000212*ffem/fem,
                                      color: const Color(0xffffffff),
                                    )
                                )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    // group3222RaX (5:4404)
                    left: 0.0011367798*fem,
                    top: 105.1014404297*fem,
                    child: Align(
                      child: SizedBox(
                        width: 80*fem,
                        height: 79.21*fem,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context)=> const LoginDriver()
                            ));
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'images/images/group-3222.png',
                            width: 80*fem,
                            height: 79.21*fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group3238iJj (5:4406)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 80*fem,
                        height: 79.49*fem,
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context, MaterialPageRoute(
                                builder: (context)=> const LoginCompany()
                            ));
                          },
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Image.asset(
                            'images/images/group-3238.png',
                            width: 80*fem,
                            height: 79.49*fem,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // path10724iT9 (5:4355)
              margin: EdgeInsets.fromLTRB(2.16*fem, 15*fem, 0*fem, 0*fem),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context)=> const AuthenticationIntro()
                  ));
                },
                style: TextButton.styleFrom (
                  padding: EdgeInsets.zero,
                ),
                child: SizedBox(
                  width: 14*fem,
                  height: 16*fem,
                  child: Image.asset(
                    'images/images/path-10724.png',
                    width: 14*fem,
                    height: 16*fem,
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