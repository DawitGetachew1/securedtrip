import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strong_security/views/client/details/clientTerm.dart';
import 'package:strong_security/views/client/payment/clientVerification.dart';

import '../../../api_connection/api_connection.dart';
import '../../../model/combinedUserDat.dart';
import '../../../model/user.dart';
import '../../../model/user_address.dart';
import '../../../model/user_detail.dart';
import '../../../utils.dart';
import 'package:http/http.dart' as http;
class ClientPayemnt extends StatefulWidget {
  final User userModel;
  final UserDetail userDetail;
  final UserAddress userAddress;
  XFile idFront;
  XFile idBack;
  XFile cProfile;
  ClientPayemnt(this.userModel, this.cProfile, this.userDetail,
      this.userAddress, this.idFront, this.idBack);

  @override
  State<ClientPayemnt> createState() => _ClientPayemntState();
}

class _ClientPayemntState extends State<ClientPayemnt> {
  String selectedPaymentMethod = '';
  void navigateToClientVerification() {
    Get.to(() => ClientVerification(widget.userModel));
  }
  saveAllUserRecord()async{
    CombinedUserData combinedData = CombinedUserData(
        widget.userModel,widget.userDetail, widget.userAddress);

    var request = http.MultipartRequest(
      'POST',
      Uri.parse(API.signUpClient),
    );

    // Add user data fields
    request.fields.addAll(combinedData.toJson());
    request.fields['paymentMethod'] = selectedPaymentMethod;
    // Add the image file
    if (widget.cProfile != null && widget.cProfile.path.isNotEmpty) {

      request.files.add(await http.MultipartFile.fromPath(
        'cProfile',
        widget.cProfile.path,
      ));
    }
    if (widget.idFront != null && widget.idFront.path.isNotEmpty) {

      request.files.add(await http.MultipartFile.fromPath(
        'idFront',
        widget.idFront.path,
      ));
    }
    if (widget.idBack != null && widget.idBack.path.isNotEmpty) {

      request.files.add(await http.MultipartFile.fromPath(
        'idBack',
        widget.idBack.path,
      ));
    }


    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        var responseBody = await response.stream.bytesToString();
        print(responseBody);
        var resBodyOfSignUp = jsonDecode(responseBody);

        if (resBodyOfSignUp['success']) {

          navigateToClientVerification();
        }  else {
          Fluttertoast.showToast(msg: ".");
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
            padding: EdgeInsets.fromLTRB(4 * fem, 72 * fem, 13 * fem, 0 * fem),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffffffff),
            ),
            child: Column(children: [
              SizedBox(
                child: Text(
                  'Choose your default payment method',
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 13 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 3 * ffem / fem,
                    letterSpacing: 0.0061500002 * fem,
                    color: const Color(0xff428adc),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25 * fem),
                child: Text(
                  'Select Card:',
                  style: SafeGoogleFont(
                    'Poppins',
                    fontSize: 16 * ffem,
                    fontWeight: FontWeight.w600,
                    height: 2.8125 * ffem / fem,
                    letterSpacing: 0.0065600002 * fem,
                    color: const Color(0xff428adc),
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.only(top: 30 * fem),
                  width: 300 * fem,
                  height: 400 * fem,
                  // decoration: BoxDecoration(
                  //   shape: BoxShape.rectangle,
                  //   color: Colors.blue
                  // ),
                  child: Column(
                    children: [
                      Row(children: [
                        Container(
                          // mastercard1Hy (5:4688)
                          margin: EdgeInsets.fromLTRB(
                              28 * fem, 15 * fem, 12 * fem, 4.8 * fem),
                          width: 37 * fem,
                          height: 22.2 * fem,
                          child: Image.asset(
                            'images/images/mastercard.png',
                            width: 37 * fem,
                            height: 22.2 * fem,
                          ),
                        ),
                        Text(
                          // mastercard6aK (5:4673)
                          'MasterCard',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 2.8125 * ffem / fem,
                            letterSpacing: 0.0065600002 * fem,
                            color: const Color(0xff428adc),
                          ),
                        ),
                        SizedBox(
                          width: 80 * fem,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10 * fem),
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
                      ]),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      Row(children: [
                        Container(
                          // mastercard1Hy (5:4688)
                          margin: EdgeInsets.fromLTRB(
                              22 * fem, 15 * fem, 17 * fem, 4.8 * fem),
                          width: 37 * fem,
                          height: 22.2 * fem,
                          child: Image.asset(
                            'images/images/auto-group-xu9u.png',
                            width: 37 * fem,
                            height: 22.2 * fem,
                          ),
                        ),
                        Text(
                          // mastercard6aK (5:4673)
                          'Bank Transfer',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 2.8125 * ffem / fem,
                            letterSpacing: 0.0065600002 * fem,
                            color: const Color(0xff428adc),
                          ),
                        ),
                        SizedBox(
                          width: 70 * fem,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10 * fem,left: 2 * fem),
                          child: Radio(
                            value: '04d7d4ae28ee6c29eda835fa9e2805b0',
                            groupValue: selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value!;
                              });
                            },
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 10 * fem,
                      ),
                      Row(children: [
                        Container(
                          // mastercard1Hy (5:4688)
                          margin: EdgeInsets.fromLTRB(
                              22 * fem, 15 * fem, 17 * fem, 4.8 * fem),
                          width: 37 * fem,
                          height: 22.2 * fem,
                          child: Image.asset(
                            'images/images/auto-group-cy9m.png',
                            width: 37 * fem,
                            height: 22.2 * fem,
                          ),
                        ),
                        Text(
                          // mastercard6aK (5:4673)
                          'Cash At Office',
                          style: SafeGoogleFont(
                            'Poppins',
                            fontSize: 16 * ffem,
                            fontWeight: FontWeight.w500,
                            height: 2.8125 * ffem / fem,
                            letterSpacing: 0.0065600002 * fem,
                            color: const Color(0xff428adc),
                          ),
                        ),
                        SizedBox(
                          width: 60 * fem,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10 * fem),
                          child: Radio(
                            value: '7ddaedcb1d2bb5bb67b8186e1e04786b',
                            groupValue: selectedPaymentMethod,
                            onChanged: (value) {
                              setState(() {
                                selectedPaymentMethod = value!;
                              });
                            },
                          ),
                        ),
                      ]),
                      SizedBox(
                        height: 50 * fem,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            50 * fem, 40 * fem, 30 * fem, 12 * fem),
                        child: ElevatedButton(
                          onPressed: () {
                            if (selectedPaymentMethod.isNotEmpty) {
                              saveAllUserRecord();
                            } else {
                              Fluttertoast.showToast(
                                  msg: "please select payment method");
                            }
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff428adc)),
                            // side: getBorder(Color(0xff428adc)),
                            minimumSize: MaterialStateProperty.all(
                                Size(168 * fem, 34 * fem)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36 * fem),
                              ),
                            ),
                          ),
                          child: Text(
                            'NEXT',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.4 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(
                            50 * fem, 0 * fem, 30 * fem, 12 * fem),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all(Colors.white),
                            backgroundColor: MaterialStateProperty.all(
                                const Color(0xff428adc)),
                            // side: getBorder(Color(0xff428adc)),
                            minimumSize: MaterialStateProperty.all(
                                Size(168 * fem, 34 * fem)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(36 * fem),
                              ),
                            ),
                          ),
                          child: Text(
                            'BACK',
                            textAlign: TextAlign.center,
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 13 * ffem,
                              fontWeight: FontWeight.w500,
                              height: 1.4 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ))
            ])));
  }
}
