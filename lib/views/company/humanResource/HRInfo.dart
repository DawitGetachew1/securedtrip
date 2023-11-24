import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strong_security/utils.dart';
import 'package:strong_security/views/company/humanResource/HRForm.dart';

class HRInfo extends StatefulWidget {
  const HRInfo({super.key});

  @override
  State<HRInfo> createState() => _HRInfoState();
}

class _HRInfoState extends State<HRInfo> {
  XFile?  _hrProfile;
  Future getImage() async {
    final picker = ImagePicker();
    final   XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _hrProfile = pickedFile;
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          // height: 400*fem,
          margin: EdgeInsets.only(top: 70*fem),
          // decoration: BoxDecoration(
          //   shape: BoxShape.rectangle,
          //   color: Colors.blue
          // ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
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
              Row(
                children: [
                  Container(
                    // group19Uoy (5:4313)
                    margin: EdgeInsets.only(left:30*fem,top: 30*fem, ),
                    width: 50*fem,
                    height: 50*fem,
                    decoration: const BoxDecoration (
                      shape: BoxShape.circle,
                    ),
                    child: TextButton(
                      onPressed: (){
                        getImage();
                      },
                      child: Image.asset('images/images/add-image.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    // addyourprofilepictureherehgj (5:4306)
                    margin: EdgeInsets.fromLTRB(20*fem, 28*fem, 0*fem, 0*fem),
                    child: TextButton(
                      onPressed: (){
                        getImage();
                      },
                      child: Text(
                        'Add your profile picture here',
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
                ],
              ),
              Container(
                margin: EdgeInsets.only(top:20*fem,left: 5*fem),
                width: 300*fem,
                height: 400*fem,

                child:  HRForm(_hrProfile??XFile('')),

              )
            ],
          ),
        ),
      ),
    );
  }
}
