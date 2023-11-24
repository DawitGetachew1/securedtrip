import 'package:flutter/material.dart';
import 'package:strong_security/views/company/humanResource/HRInfo.dart';

import '../../../utils.dart';

class HRVerification extends StatelessWidget {
  const HRVerification({super.key});

  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body:SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 80*fem,bottom: 130*fem),
              child: Text(
                'HR MANAGEMENT',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 20*ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                  elevation: 5,
                  backgroundColor: const Color(0xff428adc),
                  foregroundColor: Colors.white,
                  shape:const CircleBorder() ,
                  minimumSize: Size.square(94*fem),
                ),
                child: const Icon(
                  Icons.check,
                  size: 74,
                ),
              ),

            ),
            Container(
                width: 186*fem,
                height: 45*fem,
                margin: EdgeInsets.only(top: 40*fem, ),
                child: ElevatedButton(
                  onPressed: (){},
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xff428adc),
                      side: const BorderSide(color: Color(0xff428adc), width: 1 ),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),
                      )
                  ),
                  child: Text(
                    'Employee List',
                    style:  SafeGoogleFont(
                      'Poppins',
                      fontSize: 12 * ffem,
                      fontWeight: FontWeight.w500,
                      color: const Color(0xff428adc),
                    ),
                  ),
                )
            ),
            SizedBox(height: 10*fem,),
            ElevatedButton(
              onPressed: (){


              },
              style:
              ButtonStyle(
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(const Color(0xff428adc)),
                // side: getBorder(Color(0xff428adc)),
                minimumSize: MaterialStateProperty.all(Size(35*fem, 21*fem)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(36*fem), // Adjust the corner radius as needed
                  ),
                ),
              ),

              child: Text(
                'Role',
                textAlign: TextAlign.center,
                style:  SafeGoogleFont (
                  'Poppins',
                  fontSize: 14*ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.4*ffem/fem,
                  color: const Color(0xffffffff),
                ),
              ),
            ),
            Container(
              // group64Dq1 (5:4271)
              margin: EdgeInsets.fromLTRB(0*fem, 80*fem, 0*fem, 0*fem),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context)=> const HRInfo()
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
    );
  }
}
