
import 'package:flutter/material.dart';

import 'package:strong_security/views/company/authentication/login/formCompany.dart';
import 'package:strong_security/views/loginIntro.dart';

import '../../../../utils.dart';

class LoginCompany extends StatefulWidget {
  const LoginCompany({super.key});

  @override
  State<LoginCompany> createState() => _LoginCompanyState();
}

class _LoginCompanyState extends State<LoginCompany> {
  bool cicleMoved = false;
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(

            width: double.infinity,
            margin: EdgeInsets.fromLTRB(0, 30*fem, 0*fem, 0*fem),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text('Login',
                    style:  SafeGoogleFont (
                      'Poppins',
                      fontSize: 30*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.5*ffem/fem,
                      color: const Color(0xff428adc),
                    ),
                  ),
                ),
                const FormCompany(),

                Container(
                  // group64Dq1 (5:4271)
                  margin: EdgeInsets.fromLTRB(0*fem, 20*fem, 0*fem, 0*fem),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context)=> const LoginIntro()
                      ));
                    },
                    style: TextButton.styleFrom (
                      padding: EdgeInsets.zero,
                    ),
                    child: SizedBox(
                      width: 18*fem,
                      height: 20*fem,
                      child: Image.asset(
                        'images/images/group-64.png',
                        width: 18*fem,
                        height: 20*fem,
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
