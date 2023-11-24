import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:strong_security/views/authIntro.dart';
import 'package:strong_security/views/company/dashboard/companyDashboard.dart';
import 'package:strong_security/views/company/payment/companyPayment.dart';

import '../../../api_connection/api_connection.dart';
import '../../../model/company.dart';
import '../../../utils.dart';
import 'package:http/http.dart' as http;

import '../../client/dashboard/clientDashboard.dart';
import '../companyPreferences/company_preferences.dart';

class CompanyVerification extends StatefulWidget {
  final Company companyModel;
  const CompanyVerification(this.companyModel);

  @override
  State<CompanyVerification> createState() => _CompanyVerificationState();
}

class _CompanyVerificationState extends State<CompanyVerification> {
  final otpController = TextEditingController();
  void verifyOTP() async {
      Future<void>.delayed(Duration(seconds: 1), () {
        Get.to(() => CompanyDashboard());
      });
   
      
    
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(130*fem, 80*fem, 0, 0),
              height: 55*fem,
              child: Stack(
                children: [
                  Positioned(
                    // ellipse8ApF (5:4409)
                    left: 5.1485595703*fem,
                    top: 4.7528076172*fem,
                    child: Align(
                      child: SizedBox(
                        width: 41.9*fem,
                        height: 41.9*fem,
                        child: Container(
                          decoration: BoxDecoration (
                            borderRadius: BorderRadius.circular(20.9515514374*fem),
                            color: const Color(0xffffffff),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // group42fFD (5:4421)
                    left: 0*fem,
                    top: 0*fem,
                    child: Align(
                      child: SizedBox(
                        width: 52.2*fem,
                        height: 51.68*fem,
                        child: Image.asset(
                          'images/images/group-42.png',
                          width: 52.2*fem,
                          height: 51.68*fem,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    // maskgroup2m3M (5:4423)
                    left: 8.1000976562*fem,
                    top: 7.6711425781*fem,
                    child: Align(
                      child: SizedBox(
                        width: 36*fem,
                        height: 36*fem,
                        child: Image.asset(
                          'images/images/mask-group-2-jdR.png',
                          width: 36*fem,
                          height: 36*fem,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              // emailvarificationjuH (5:4516)
              margin: EdgeInsets.fromLTRB(0.09*fem, 10*fem, 0*fem, 29.16*fem),
              child: Text(
                'EMAIL VARIFICATION',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 15*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
            ),
            Container(
              // putyourotpthatwassendtoyourema (5:4518)
              margin: EdgeInsets.fromLTRB(0*fem, 0*fem, 0*fem, 19*fem),
              constraints: BoxConstraints (
                maxWidth: 254*fem,
              ),
              child: Text(
                'Put your OTP that was send to your email \naccount here to Verify this is you',
                textAlign: TextAlign.center,
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 10*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
            ),
            SizedBox(
              width: 246*fem,
              height: 54*fem,
              child: TextFormField(
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly,
                ],
                controller: otpController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20*fem),
                  ) ,

                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(35*fem, 50*fem, 30*fem, 12*fem),

              child: ElevatedButton(
                onPressed: (){
                  verifyOTP();
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
                  'FINSH',
                  textAlign: TextAlign.center,
                  style:  SafeGoogleFont (
                    'Poppins',
                    fontSize: 15*ffem,
                    fontWeight: FontWeight.w700,
                    height: 1.4*ffem/fem,
                    color: const Color(0xffffffff),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
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
                    width: 22*fem,
                    height: 22*fem,
                    child: Image.asset(
                      'images/images/home-p8w.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 0*fem,),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: SizedBox(
                    width: 14*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'images/images/polygon-1-bF5.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),


              ],
            )
          ],
        ),
      ),
    );
  }
}
