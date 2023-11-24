import 'package:flutter/material.dart';
import 'package:strong_security/utils.dart';
import 'authIntro.dart';


class Intropage1 extends StatefulWidget {
  const Intropage1({super.key});


  @override
  State<Intropage1> createState() => _Intropage1State();
}

class _Intropage1State extends State<Intropage1> {
  bool isTextbutton = true;
  void _toggleButton(){
    setState(() {
          isTextbutton = !isTextbutton;
    });
  }
  @override
  Widget build(BuildContext context) {

    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return SizedBox(
      width: double.infinity,
      child: Container(
        // QwH (5:4135)
        width: double.infinity,
        height: 480*fem,
        decoration: const BoxDecoration (
          color: Color(0xffffffff),
        ),
        child: Stack(
          children: [
            Positioned(
              // rectangle1YGo (5:4136)
              left: 4*fem,
              top: 2*fem,
              child: Align(
                child: SizedBox(
                  width: 320*fem,
                  height: 480*fem,
                  child: Container(
                    decoration: const BoxDecoration (
                      color: Color(0xffffffff),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              // welcomeqWo (5:4137)
              left: 15*fem,
              top: 252*fem,
              child: Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 300*fem,
                  height: 75*fem,
                  child: TextButton(
                    onPressed: () {

                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: Text(
                      'WELCOME',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 50*ffem,
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
              // twozbusinessplcdigitalsystemsu (5:4138)
              left: 70*fem,
              top: 315*fem,
              child: Align(
                child: SizedBox(
                  width: 208*fem,
                  height: 15*fem,
                  child: Text(
                    'TWO Z BUSINESS PLC DIGITAL SYSTEMS',
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
            Positioned(
              // group6zHD (5:4144)
              left: 101*fem,
              top: 423*fem,
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
                  width: 118*fem,
                  height: 42*fem,
                  decoration: BoxDecoration (
                    color: const Color(0xff428adc),
                    borderRadius: BorderRadius.circular(21*fem),
                  ),
                  child: Center(
                    child: Text(
                      'SKIP',
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
            Positioned(
              // group35rKR (5:4145)
              left: 136*fem,
              top: 365*fem,
              child: Align(
                child: SizedBox(
                  width: 48*fem,
                  height: 24*fem,
                  child: Image.asset(
                    'images/images/group-35.png',
                    width: 48*fem,
                    height: 24*fem,
                  ),
                ),
              ),
            ),
            Positioned(
              // component19kvb (5:4043)
                left: 89*fem,
                top: 90*fem,
                child: Container(

                    width: 142*fem,
                    height: 142*fem,
                    decoration: BoxDecoration (
                      border: Border.all(color: const Color(0xff428adc)),
                      borderRadius: BorderRadius.circular(71*fem),
                    ),
                    child: Stack(
                        children: [
                          Positioned(
                            // ellipse2T4K (5:3953)
                            left: 20*fem,
                            top: 20*fem,
                            child: Align(
                              child: isTextbutton?SizedBox(
                                width: 102*fem,
                                height: 102*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(51*fem),
                                    color: const Color(0xff428adc),
                                  ),
                                ),
                              ):
                              SizedBox(
                                width: 118*fem,
                                height: 118*fem,
                                child: Container(
                                  decoration: BoxDecoration (
                                    borderRadius: BorderRadius.circular(51*fem),
                                    color: const Color(0xff428adc),
                                  ),
                                ),
                              ),
                            ),
                          )]))),
                    Positioned(
                      // securityZ7M (5:3954)
                      left: 126*fem,
                      top: 127*fem,
                      child: Align(
                        child: SizedBox(
                          width: 68*fem,
                          height: 68*fem,
                          child:
                          Image.asset('images/images/security.png',
                            fit: BoxFit.cover,)

                          ),
                        ),
                      ),
    ])));
  }
}