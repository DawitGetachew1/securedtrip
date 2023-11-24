import 'package:flutter/material.dart';
import 'package:strong_security/utils.dart';

import 'authIntro.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SizedBox(
      width: double.infinity,
      child: Container(
        // FD1 (5:4162)
        padding: EdgeInsets.fromLTRB(22*fem, 90*fem, 21*fem, 45*fem),
        width: double.infinity,
        decoration: const BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // group18xt7 (5:4174)
              margin: EdgeInsets.fromLTRB(67*fem, 0*fem, 68*fem, 37*fem),
              width: double.infinity,
              height: 142*fem,
              decoration: BoxDecoration (
                border: Border.all(color: const Color(0xff428adc)),
                borderRadius: BorderRadius.circular(71*fem),
              ),
              child: Stack(
                children: [
                  Positioned(
                    // ellipse2ULf (5:4169)
                    left: 18*fem,
                    top: 18*fem,
                    child: Align(
                      child: SizedBox(
                        width: 106*fem,
                        height: 106*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(53*fem),
                            color: const Color(0xff428adc),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // securityaPh (5:4170)
                    left: 29*fem,
                    top: 29*fem,
                    child: Align(
                      child: SizedBox(
                        width: 84*fem,
                        height: 84*fem,
                        child: Image.asset(
                          'images/images/security-LtP.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // autogroup2opj6N3 (NSCD2yYQ8pkmDiYa7U2opj)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 26*fem),
              width: double.infinity,
              height: 50*fem,
              child: Stack(
                children: [
                  Positioned(
                    // strongsecurityDhZ (5:4164)
                    left: -20*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 320*fem,
                        height: 45*fem,
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom (
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            'STRONG SECURITY',
                            style: SafeGoogleFont (
                              'Poppins',
                              fontSize: 28*ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.5*ffem/fem,
                              color: const Color(0xff428adc),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // fromthecompanytwozHhR (5:4165)
                    left: 70*fem,
                    top: 35*fem,
                    child: Align(
                      child: SizedBox(
                        width: 137*fem,
                        height: 15*fem,
                        child: Text(
                          'FROM THE COMPANY TWO Z',
                          style: SafeGoogleFont (
                            'Poppins',
                            fontSize: 10*ffem,
                            fontWeight: FontWeight.w500,
                            height: 1.5*ffem/fem,
                            color: const Color(0xff428adc),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // group36NTy (5:4175)
              margin: EdgeInsets.fromLTRB(0*fem, 10*fem, 0*fem, 50*fem),
              width: 47*fem,
              height: 24*fem,
              child: Image.asset(
                'images/images/group-36.png',
                width: 47*fem,
                height: 24*fem,
              ),
            ),
            Container(
              // group7Umu (5:4173)
              margin: EdgeInsets.fromLTRB(79*fem, 0*fem, 80*fem, 0*fem),
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
                child: Container(
                  width: double.infinity,
                  height: 42*fem,
                  decoration: BoxDecoration (
                    color: const Color(0xff428adc),
                    borderRadius: BorderRadius.circular(21*fem),
                  ),
                  child: Center(
                    child: Text(
                      'NEXT',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 20*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.5*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
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