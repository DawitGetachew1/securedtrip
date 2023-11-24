import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strong_security/model/user_detail.dart';
import 'package:strong_security/views/client/authentication/signup/signupClient.dart';
import 'package:strong_security/views/client/details/clientAddress.dart';
import 'package:strong_security/views/signupIntro.dart';

import '../../../model/user.dart';
import '../../../utils.dart';

class ClientDetail extends StatefulWidget {
  final User userModel;
  XFile cProfile;

  ClientDetail(this.userModel,this.cProfile);

  @override
  State<ClientDetail> createState() => _ClientDetailState();
}

class _ClientDetailState extends State<ClientDetail> {
  String? selectedGender;
  String cGender="";
  XFile? _idFront;
  XFile? _idBack;
  int selectedDay = 30;
  int selectedMonth = 12;
  int selectedYear = 2000;
  String dateOfBirth = "";
  @override
  void initState() {
    super.initState();
    selectedGender = 'Male';
  }
  Future getImageFront(ImageSource media) async {
    final picker = ImagePicker();
    final   XFile? pickedFile = await picker.pickImage(source: media);

    setState(() {
      if (pickedFile != null) {
        _idFront = pickedFile;
      } else {
        print('No image selected.');
      }
    });
  }
  Future getImageBack(ImageSource media) async {
    final picker = ImagePicker();
    final   XFile? pickedFile = await picker.pickImage(source: media);

    setState(() {
      if (pickedFile != null) {
        _idBack = pickedFile;
      } else {
        print('No image selected.');
      }
    });
  }
  

  void _selectGender(String? gender) {
    setState(() {
      selectedGender = gender;
    });
  }
  SaveClientDetail(){
    UserDetail userDetail = UserDetail(dateOfBirth, cGender);
    Future<void>.delayed(Duration(seconds: 1), () {
      // print(_image!.path);
      Get.to(() => ClientAddress(widget.userModel, widget.cProfile,userDetail,_idFront??XFile(''),_idBack??XFile('')));
    });
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return  Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 60*fem),
        child: Column(
          children: [
            Align(
              child: Text(
                'PERSONAL DETAIL',
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
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      // image1
                      margin: EdgeInsets.fromLTRB(83*fem, 30*fem, 0*fem, 0*fem),
                      width: 30*fem,
                      height: 30*fem,
                      child: TextButton(
                        onPressed: (){
                          getImageFront(ImageSource.gallery);
                        },
                        child: Image.asset(
                          'images/images/mask-group-1-BC3.png',
                          width: 68*fem,
                          height: 68*fem,
                        ),
                      ),
                    ),



                    _idFront != null
                        ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //to show image, you type like this.
                          File(_idFront!.path),
                          fit: BoxFit.cover,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    )

                        : Padding(
                          padding: const EdgeInsets.fromLTRB(110, 0, 0, 0),
                          child: Text(
                      "No Image",
                      style: TextStyle(fontSize: 10),
                    ),
                        ),








                    Container(
                      // idfront1
                      margin: EdgeInsets.fromLTRB(90*fem, 0*fem, 0*fem, 0*fem),
                      child: Text(
                        'ID FRONT',
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
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // image2
                      margin: EdgeInsets.fromLTRB(18*fem, 30*fem, 0*fem, 0*fem),
                      width: 30*fem,
                      height: 30*fem,
                      child: TextButton(
                        onPressed: (){
                          getImageBack(ImageSource.gallery);
                        },
                        child: Image.asset(
                          'images/images/mask-group-1-BC3.png',
                          width: 68*fem,
                          height: 68*fem,
                        ),
                      ),
                    ),

                    _idBack != null
                        ? Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.file(
                          //to show image, you type like this.
                          File(_idBack!.path),
                          fit: BoxFit.cover,
                          width: 30,
                          height: 30,
                        ),
                      ),
                    )

                        : Padding(
                          padding: const EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                      "No Image",
                      style: TextStyle(fontSize: 10),

                    ),
                        ),








                    Container(
                      // idfront2
                      margin: EdgeInsets.fromLTRB(25*fem, 0*fem, 0*fem, 0*fem),
                      child: Text(
                        'ID BACK',
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
                  ],
                ),
              ],

            ),
            Container(
              margin: EdgeInsets.only(top: 50*fem,bottom: 20*fem),
              child: Align(
                child:  Text(
                  'Gender',
                  style: SafeGoogleFont (
                    'Poppins',
                    fontSize: 12*ffem,
                    fontWeight: FontWeight.w500,
                    height: 1.5*ffem/fem,
                    color: const Color(0xff428adc),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => _selectGender('Male'),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),),
                    child: CircleAvatar(

                      backgroundColor:
                      selectedGender == 'Male' ? Colors.blue : Colors.white,
                      child: Text(
                        'M',
                        style:  SafeGoogleFont (
                          'Poppins',
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: selectedGender == 'Male' ? Colors.white :  const Color(0xff428adc),

                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => _selectGender('Female'),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.blue,
                        width: 2.0,
                      ),),
                    child: CircleAvatar(

                      backgroundColor:
                      selectedGender == 'Female' ? Colors.blue : Colors.white,
                      child: Text(
                        'F',
                        style:  SafeGoogleFont (
                          'Poppins',
                          fontSize: 15*ffem,
                          fontWeight: FontWeight.w500,
                          height: 1.5*ffem/fem,
                          color: selectedGender == 'Female' ? Colors.white :  const Color(0xff428adc),

                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 48*fem,),
            Align(
              child:  Text(
                'Date Of Birth',
                style: SafeGoogleFont (
                  'Poppins',
                  fontSize: 12*ffem,
                  fontWeight: FontWeight.w500,
                  height: 1.5*ffem/fem,
                  color: const Color(0xff428adc),
                ),
              ),
            ),
            SizedBox(height: 10*fem,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 30*fem,
                  padding: EdgeInsets.only(left: 10*fem),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5*fem)
                  ),
                  child: DropdownButton<int>(

                    value: selectedDay,
                    onChanged: (newValue) {
                      setState(() {
                        selectedDay = newValue!;
                      });
                    },
                    menuMaxHeight: 140*fem,
                    dropdownColor: Colors.blue,
                    items: List.generate(31, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text('${index + 1}'),
                      );
                    }),

                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    underline: Container(),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 30*fem,
                  padding: EdgeInsets.only(left: 10*fem),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5*fem)
                  ),
                  child: DropdownButton<int>(
                    value: selectedMonth,
                    onChanged: (newValue) {
                      setState(() {
                        selectedMonth = newValue!;
                      });
                    },
                    items: List.generate(12, (index) {
                      return DropdownMenuItem<int>(
                        value: index + 1,
                        child: Text('${index + 1}'),
                      );
                    }),
                    menuMaxHeight: 140*fem,
                    dropdownColor: Colors.blue,
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    underline: Container(),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  height: 30*fem,
                  padding: EdgeInsets.only(left: 10*fem),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(5*fem)
                  ),
                  child: DropdownButton<int>(
                    value: selectedYear,
                    onChanged: (newValue) {
                      setState(() {
                        selectedYear = newValue!;
                      });
                    },
                    items: List.generate(50, (index) {
                      return DropdownMenuItem<int>(
                        value: 2000 - index,
                        child: Text('${2000 - index}'),
                      );
                    }),
                    menuMaxHeight: 140*fem,
                    dropdownColor: Colors.blue,
                    style: const TextStyle(color: Colors.white),
                    icon: const Icon(Icons.arrow_drop_down, color: Colors.white),
                    underline: Container(),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 80*fem,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(
                      builder: (context)=> const SignUpIntro()
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

                TextButton(
                  onPressed: () {
                    dateOfBirth = '${selectedDay.toString().padLeft(2, '0')}/${selectedMonth.toString().padLeft(2, '0')}/${selectedYear.toString()}';
                    cGender = selectedGender!;
                    SaveClientDetail();
                  },
                  style: TextButton.styleFrom (
                    padding: EdgeInsets.zero,
                  ),
                  child: SizedBox(
                    width: 14*fem,
                    height: 16*fem,
                    child: Image.asset(
                      'images/images/polygon-4.png',
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
