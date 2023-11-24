import 'package:flutter/material.dart';
import 'package:strong_security/utils.dart';
import 'package:strong_security/views/client/details/clientAddress.dart';
import 'authIntro.dart';
import 'package:strong_security/views/company/authentication/signup/signupCompany.dart';

import 'package:strong_security/views/client/authentication/signup/signupClient.dart';

class SignUpIntro extends StatelessWidget {
  const SignUpIntro({super.key});



  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          child: Container(
            // aW3 (5:4351)
    //      padding: EdgeInsets.fromLTRB(105.92*fem, 41.64*fem, 122.08*fem, 51.9*fem),
            width: double.infinity,
            decoration: const BoxDecoration (
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  // logingoy (5:4353)
                  margin: EdgeInsets.fromLTRB(0*fem, 86*fem, 0*fem, 0*fem),
                  child:
                 Text( 'SIGN UP',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 30*ffem,
                        fontWeight: FontWeight.bold,
                        height: 1.2*ffem/fem,
                        color: const Color(0xff428adc),
                      ),
                    ),
                  ),

                Container(
                  // autogroupmyyjPCb (NSCKaCpBA7qqdRQYKpMyYj)
                  margin: EdgeInsets.fromLTRB(120*fem, 40*fem, 5.92*fem, 25.61*fem),
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
                            child: Text('CLIENT',
                                  style: SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 12*ffem,
                                    fontWeight: FontWeight.bold,
                                    height: 1.2000000212*ffem/fem,
                                    color: const Color(0xffffffff),

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
                                    builder: (context)=> SignUpClient()
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
                  margin: EdgeInsets.fromLTRB(120*fem, 0*fem, 5.92*fem, 25.61*fem),
                  width: double.infinity,
                  height: 184.31*fem,
                  child: Stack(
                    children: [
                      Positioned(
                        // group3235Nyd (5:4399)
                        left: 7.7817230225*fem,
                        top: 50*fem,
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
                                  child: Text('COMPANY',
                                        style: SafeGoogleFont (
                                          'Poppins',
                                          fontSize: 10*ffem,
                                          fontWeight: FontWeight.bold,
                                          height: 1.2000000212*ffem/fem,
                                          color: const Color(0xffffffff),

                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ),

                      Positioned(
                        // group3238iJj (5:4406)
                        left: 0*fem,
                        top: 43*fem,
                        child: Align(
                          child: SizedBox(
                            width: 80*fem,
                            height: 79.49*fem,
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context, MaterialPageRoute(
                                    builder: (context)=> const SignUpCompany()
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
        ),
      ),
    );
  }
}