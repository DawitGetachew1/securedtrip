import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strong_security/model/company_Inf.dart';
import 'package:strong_security/views/company/authentication/signup/signupCompany.dart';
import 'package:strong_security/views/company/details/companyTerms.dart';
import 'package:strong_security/views/signupIntro.dart';
import '../../../../utils.dart';
import '../../../model/company.dart';
import '../../client/details/clientAddress.dart';


class CompanyDetail extends StatefulWidget {
  final Company companyModel;
  XFile companyProfile;
  CompanyDetail(this.companyModel, this.companyProfile);

  @override
  State<CompanyDetail> createState() => _CompanyDetailState();
}

class _CompanyDetailState extends State<CompanyDetail> {
  final _formfield = GlobalKey<FormState>();

  final vatController = TextEditingController();

  final tinNoController = TextEditingController();

  final licenseController = TextEditingController();

  SaveCompanyDetail(){
    CompanyInf companyInf = CompanyInf(
        vatController.text.trim() ,
        tinNoController.text.trim() ,
        licenseController.text.trim()
    );
    Future<void>.delayed(Duration(seconds: 1), () {
      // print(_image!.path);
      Get.to(() => CompanyTerms(widget.companyModel, widget.companyProfile,companyInf));
    });
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return  Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 80*fem,bottom: 180*fem),
                child: Text(
                  'COMPANY DETAIL',
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
                  SizedBox(
                    width: 50*fem,
                  ),
                  Text(
                    'Vat *',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 10*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5*ffem/fem,
                      color: const Color(0xff428adc),
                    ),
                  ),
                  SizedBox(
                    width: 55*fem,
                  ),
                  SizedBox(
                    width: 136*fem,

                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,

                      controller: vatController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10*fem),
                        ) ,

                        contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                      ),
                      validator: (input){
                        if(input!.isEmpty){
                          return "Enter the VAT";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12*fem ,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50*fem,
                  ),
                  Text('TIN Number *',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 10*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5*ffem/fem,
                      color: const Color(0xff428adc),
                    ),
                  ),
                  SizedBox(
                    width: 10*fem,
                  ),
                  SizedBox(
                    width: 136*fem,

                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,

                      controller: tinNoController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10*fem),
                        ) ,

                        contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                      ),
                      validator: (input){
                        if(input!.isEmpty){
                          return "Enter the TIN number";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12*fem ,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 50*fem,
                  ),
                  Text('License * ',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 10*ffem,
                      fontWeight: FontWeight.w500,
                      height: 1.5*ffem/fem,
                      color: const Color(0xff428adc),
                    ),
                  ),
                  SizedBox(
                    width: 30*fem,
                  ),
                  SizedBox(
                    width: 136*fem,
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      onTap: (){


                      },
                      controller: licenseController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10*fem),
                        ) ,

                        contentPadding: EdgeInsets.symmetric(vertical: 10*fem, horizontal: 8*fem),
                      ),
                      validator: (input){
                        if(input!.isEmpty){
                          return "Enter the License number";
                        }
                        return null;
                      },
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
                      if(_formfield.currentState!.validate()) {
                        SaveCompanyDetail();
                      }

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
      ),
    );
  }
}
