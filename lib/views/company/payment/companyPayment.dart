import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strong_security/views/client/details/clientTerm.dart';
import 'package:strong_security/views/company/details/companyTerms.dart';
import 'package:strong_security/views/company/payment/companyVerification.dart';

import '../../../api_connection/api_connection.dart';
import '../../../model/combinedCompanyDat.dart';
import '../../../model/company.dart';
import '../../../model/company_Inf.dart';
import '../../../utils.dart';
import 'package:http/http.dart' as http;


class CompanyPayemnt extends StatefulWidget {
  final Company companyModel;
  XFile companyProfile;
  final CompanyInf companyInf;
  CompanyPayemnt(this.companyModel, this.companyProfile,this.companyInf);

  @override
  State<CompanyPayemnt> createState() => _CompanyPayemntState();
}

class _CompanyPayemntState extends State<CompanyPayemnt> {
  String selectedPaymentMethod = '';
  void navigateToCompanyVerification() {
    Get.to(() => CompanyVerification(widget.companyModel));
  }
  saveAllCompanyRecord()async{
    CombinedCompanyData combinedData = CombinedCompanyData(
        widget.companyModel,widget.companyInf);

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(API.signUpCompany),
    );

    // Add user data fields
    request.fields.addAll(combinedData.toJson());
    request.fields['paymentMethod'] = selectedPaymentMethod;
    // Add the image file
    if (widget.companyProfile != null && widget.companyProfile.path.isNotEmpty) {
      request.files.add(await http.MultipartFile.fromPath(
        'companyProfile',
        widget.companyProfile.path,
      ));
    }

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print(responseBody);
        var resBodyOfSignUp = jsonDecode(responseBody);
        if (resBodyOfSignUp['success']) {
         navigateToCompanyVerification();
        } else {
          Fluttertoast.showToast(msg: "error.");
        }
      }
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        body: Container(
            padding: EdgeInsets.fromLTRB(4*fem, 72*fem, 13*fem, 0*fem),
            width: double.infinity,
            decoration: const BoxDecoration (
              color: Color(0xffffffff),
            ),
            child: Column(
                children: [
                  SizedBox(

                    child: Text(
                      'Choose your default payment method',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 13*ffem,
                        fontWeight: FontWeight.w600,
                        height: 3*ffem/fem,
                        letterSpacing: 0.0061500002*fem,
                        color: const Color(0xff428adc),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.only(left: 25*fem),
                    child: Text(
                      'Select Card:',
                      style: SafeGoogleFont (
                        'Poppins',
                        fontSize: 16*ffem,
                        fontWeight: FontWeight.w600,
                        height: 2.8125*ffem/fem,
                        letterSpacing: 0.0065600002*fem,
                        color: const Color(0xff428adc),
                      ),
                    ),
                  ),

                  Container(
                      padding: EdgeInsets.only(top: 40*fem),
                      width: 300*fem,
                      height: 400*fem,
                      child: Column(

                        children: [
                          Row(

                              children: [
                                Container(
                                  // mastercard1Hy (5:4688)
                                  margin: EdgeInsets.fromLTRB(28*fem, 15*fem, 12*fem, 4.8*fem),
                                  width: 37*fem,
                                  height: 22.2*fem,
                                  child: Image.asset(
                                    'images/images/mastercard.png',
                                    width: 37*fem,
                                    height: 22.2*fem,
                                  ),
                                ),
                                Text(
                                  // mastercard6aK (5:4673)
                                  'MasterCard',
                                  style: SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 2.8125*ffem/fem,
                                    letterSpacing: 0.0065600002*fem,
                                    color: const Color(0xff428adc),
                                  ),
                                ),
                                SizedBox(
                                  width: 80*fem,
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top:10*fem),
                                  child: Radio(
                                    value: 'Master Card',
                                    groupValue: selectedPaymentMethod,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPaymentMethod = value!;
                                      });
                                    },
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(height: 10*fem,),
                          Row(

                              children: [
                                Container(
                                  // mastercard1Hy (5:4688)
                                  margin: EdgeInsets.fromLTRB(22*fem, 15*fem, 17*fem, 4.8*fem),
                                  width: 37*fem,
                                  height: 22.2*fem,
                                  child: Image.asset(
                                    'images/images/auto-group-xu9u.png',
                                    width: 37*fem,
                                    height: 22.2*fem,
                                  ),
                                ),
                                Text(
                                  // mastercard6aK (5:4673)
                                  'Bank',
                                  style: SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 2.8125*ffem/fem,
                                    letterSpacing: 0.0065600002*fem,
                                    color: const Color(0xff428adc),
                                  ),
                                ),
                                SizedBox(
                                  width: 70*fem,
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top:10*fem),
                                  child: Radio(
                                    value: 'Bank',
                                    groupValue: selectedPaymentMethod,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPaymentMethod = value!;
                                      });
                                    },
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(height: 10*fem,),
                          Row(

                              children: [
                                Container(
                                  // mastercard1Hy (5:4688)
                                  margin: EdgeInsets.fromLTRB(22*fem, 15*fem, 17*fem, 4.8*fem),
                                  width: 37*fem,
                                  height: 22.2*fem,
                                  child: Image.asset(
                                    'images/images/auto-group-cy9m.png',
                                    width: 37*fem,
                                    height: 22.2*fem,
                                  ),
                                ),
                                Text(
                                  // mastercard6aK (5:4673)
                                  'Cash At Office',
                                  style: SafeGoogleFont (
                                    'Poppins',
                                    fontSize: 16*ffem,
                                    fontWeight: FontWeight.w500,
                                    height: 2.8125*ffem/fem,
                                    letterSpacing: 0.0065600002*fem,
                                    color: const Color(0xff428adc),
                                  ),
                                ),
                                SizedBox(
                                  width: 60*fem,
                                ),
                                Padding(
                                  padding:  EdgeInsets.only(top:10*fem),
                                  child: Radio(
                                    value: 'Cash At Office',
                                    groupValue: selectedPaymentMethod,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPaymentMethod = value!;
                                      });
                                    },
                                  ),
                                ),
                              ]
                          ),
                          SizedBox(height: 50*fem,),
                          Container(
                            margin: EdgeInsets.fromLTRB(50*fem, 40*fem, 30*fem, 12*fem),

                            child: ElevatedButton(
                              onPressed: (){
                                if (selectedPaymentMethod.isNotEmpty) {
                                  saveAllCompanyRecord();
                                }
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
                                'NEXT',
                                textAlign: TextAlign.center,
                                style:  SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4*ffem/fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(50*fem, 0*fem, 30*fem, 12*fem),

                            child: ElevatedButton(
                              onPressed: (){
                                Navigator.pop(context);
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
                                'BACK',
                                textAlign: TextAlign.center,
                                style:  SafeGoogleFont (
                                  'Poppins',
                                  fontSize: 13*ffem,
                                  fontWeight: FontWeight.w500,
                                  height: 1.4*ffem/fem,
                                  color: const Color(0xffffffff),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                  )
                ]
            )
        )

    );
  }
}
