import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:strong_security/model/user_address.dart';
import 'package:strong_security/views/client/payment/clientPayment.dart';

import '../../../model/user.dart';
import '../../../model/user_detail.dart';
import '../../../utils.dart';

class ClientTerms extends StatefulWidget {
  final User userModel;
  final UserDetail userDetail;
  final UserAddress userAddress;
  XFile idFront;
  XFile idBack;
  XFile cProfile;
    ClientTerms(this.userModel,this.cProfile,this.userDetail,this.userAddress,this.idFront,this.idBack);

  @override
  State<ClientTerms> createState() => _ClientTermsState();
}

class _ClientTermsState extends State<ClientTerms> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    double baseWidth = 320;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 40*fem),
          padding: EdgeInsets.fromLTRB(38*fem, 0, 30*fem, 0),

          child: Column(
            children: [
          Container(
            margin: EdgeInsets.fromLTRB(100*fem, 80*fem, 0, 0),
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
                margin: EdgeInsets.only(top: 20*fem),
                decoration: BoxDecoration(
                  border: Border.all(color:const Color(0xff428adc),width: 1 )

                ),
                child: Text(
                  'TERMS AND CONDITIONS',
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
                width: 246*fem,
                height: 239*fem,
                padding: EdgeInsets.fromLTRB(20*fem, 10*fem, 20*fem, 10*fem),
                decoration:BoxDecoration(
                  border: Border.all(color: const Color(0xff428adc),width: 1),
                  borderRadius: BorderRadius.circular(30*fem),
                  ),
                child: SingleChildScrollView(
                  child: Text(
                    'TERMS OF USE\nLast updated July 23, 2023\nAGREEMENT TO OUR LEGAL TERMS\nWe are __________ ("Company," "we," "us," "our").\nWe operate the mobile application Security (the "App"), as well as any other related\nproducts and services that refer or link to these legal terms (the "Legal Terms")\n(collectively, the "Services").\nYou can contact us by email at __________ or by mail to __________,\n__________, __________.\nThese Legal Terms constitute a legally binding agreement made between you,\nwhether personally or on behalf of an entity ("you"), and __________, concerning\nyour access to and use of the Services. You agree that by accessing the Services,\nyou have read, understood, and agreed to be bound by all of these Legal Terms. IF\nYOU DO NOT AGREE WITH ALL OF THESE LEGAL TERMS, THEN YOU ARE\nEXPRESSLY PROHIBITED FROM USING THE SERVICES AND YOU MUST\nDISCONTINUE USE IMMEDIATELY.\nSupplemental terms and conditions or documents that may be posted on the\nServices from time to time are hereby expressly incorporated herein by reference.\nWe reserve the right, in our sole discretion, to make changes or modifications to\nthese Legal Terms from time to time. We will alert you about any changes by\nupdating the "Last updated" date of these Legal Terms, and you waive any right to\nreceive specific notice of each such change. It is your responsibility to periodically\nreview these Legal Terms to stay informed of updates. You will be subject to, and will\nbe deemed to have been made aware of and to have accepted, the changes in any\nrevised Legal Terms by your continued use of the Services after the date such\nrevised Legal Terms are posted.\nThe Services are intended for users who are at least 13 years of age. All users who\nare minors in the jurisdiction in which they reside (generally under the age of 18)\nmust have the permission of, and be directly supervised by, their parent or guardian\nto use the Services. If you are a minor, you must have your parent or guardian read\nand agree to these Legal Terms prior to you using the Services.\nWe recommend that you print a copy of these Legal Terms for your records.\nTABLE OF CONTENTS\n1. OUR SERVICES\n2. INTELLECTUAL PROPERTY RIGHTS\n3. USER REPRESENTATIONS\n4. USER REGISTRATION\n5. PURCHASES AND PAYMENT\n6. POLICY\n7. PROHIBITED ACTIVITIES\n8. USER GENERATED CONTRIBUTIONS\n9. CONTRIBUTION LICENSE\nCustom Branding\nHide “Powered by Termly\nCustomize Policy Styl\nTheme\nSelect "Create New Theme" to edi\nTo create a custo\nupgrade. Pro+ pla\n\$15/month. VIEW\nSharp (Default)\nAPPLY THEME\n7/23/23, 10:17 AM Termly\nhttps://app.termly.io/dashboard/website/7d95d4c9-9c03-44d3-ae30-58dbb38762c3/terms-of-service 2/11\n10. MOBILE APPLICATION LICENSE\n11. SOCIAL MEDIA\n12. SERVICES MANAGEMENT\n13. PRIVACY POLICY\n14. TERM AND TERMINATION\n15. MODIFICATIONS AND INTERRUPTIONS\n16. GOVERNING LAW\n17. DISPUTE RESOLUTION\n18. CORRECTIONS\n19. DISCLAIMER\n20. LIMITATIONS OF LIABILITY\n21. INDEMNIFICATION\n22. USER DATA\n23. ELECTRONIC COMMUNICATIONS, TRANSACTIONS, AND SIGNATURES\n24. CALIFORNIA USERS AND RESIDENTS\n25. MISCELLANEOUS\n26. CONTACT US\n1. OUR SERVICES\nThe information provided when using the Services is not intended for distribution to\nor use by any person or entity in any jurisdiction or country where such distribution or\nuse would be contrary to law or regulation or which would subject us to any\nregistration requirement within such jurisdiction or country. Accordingly, those\npersons who choose to access the Services from other locations do so on their own\ninitiative and are solely responsible for compliance with local laws, if and to the extent\nlocal laws are applicable.\n__________\n2. INTELLECTUAL PROPERTY RIGHTS\nOur intellectual property\nWe are the owner or the licensee of all intellectual property rights in our Services,\nincluding all source code, databases, functionality, software, website designs, audio,\nvideo, text, photographs, and graphics in the Services (collectively, the "Content"), as\nwell as the trademarks, service marks, and logos contained therein (the "Marks").\nOur Content and Marks are protected by copyright and trademark laws (and various\nother intellectual property rights and unfair competition laws) and treaties in the\nUnited States and around the world.\nThe Content and Marks are provided in or through the Services "AS IS" for your\npersonal, non-commercial use or internal business purpose only.\nYour use of our Services\nSubject to your compliance with these Legal Terms, including the "PROHIBITED\nACTIVITIES" section below, we grant you a non-exclusive, non-transferable,\nrevocable license to:\naccess the Services; and\ndownload or print a copy of any portion of the Content to which you have\nproperly gained access.\nsolely for your personal, non-commercial use or internal business purpose.\nExcept as set out in this section or elsewhere in our Legal Terms, no part of the\nServices and no Content or Marks may be copied, reproduced, aggregated,\nrepublished, uploaded, posted, publicly displayed, encoded, translated, transmitted,\ndistributed, sold, licensed, or otherwise exploited for any commercial purpose\nwhatsoever, without our express prior written permission.\nIf you wish to make any use of the Services, Content, or Marks other than as set out\nin this section or elsewhere in our Legal Terms, please address your request to:\n__________. If we ever grant you the permission to post, reproduce, or publicly\ndisplay any part of our Services or Content, you must identify us as the owners or\n7/23/23, 10:17 AM Termly\nhttps://app.termly.io/dashboard/website/7d95d4c9-9c03-44d3-ae30-58dbb38762c3/terms-of-service 3/11\nlicensors of the Services, Content, or Marks and ensure that any copyright or\nproprietary notice appears or is visible on posting, reproducing, or displaying our\nContent.\nWe reserve all rights not expressly granted to you in and to the Services, Content,\nand Marks.\nAny breach of these Intellectual Property Rights will constitute a material breach of\nour Legal Terms and your right to use our Services will terminate immediately.\nYour submissions\nPlease review this section and the "PROHIBITED ACTIVITIES" section carefully prior\nto using our Services to understand the (a) rights you give us and (b) obligations you\nhave when you post or upload any content through the Services.\nSubmissions: By directly sending us any question, comment, suggestion, idea,\nfeedback, or other information about the Services ("Submissions"), you agree to\nassign to us all intellectual property rights in such Submission. You agree that we\nshall own this Submission and be entitled to its unrestricted use and dissemination\nfor any lawful purpose, commercial or otherwise, without acknowledgment or\ncompensation to you.\nYou are responsible for what you post or upload: By sending us Submissions\nthrough any part of the Services you:\nconfirm that you have read and agree with our "PROHIBITED ACTIVITIES"\nand will not post, send, publish, upload, or transmit through the Services any\nSubmission that is illegal, harassing, hateful, harmful, defamatory, obscene,\nbullying, abusive, discriminatory, threatening to any person or group, sexually\nexplicit, false, inaccurate, deceitful, or misleading;\nto the extent permissible by applicable law, waive any and all moral rights to\nany such Submission;\nwarrant that any such Submission are original to you or that you have the\nnecessary rights and licenses to submit such Submissions and that you have\nfull authority to grant us the above-mentioned rights in relation to your\nSubmissions; and\nwarrant and represent that your Submissions do not constitute confidential\ninformation.\nYou are solely responsible for your Submissions and you expressly agree to\nreimburse us for any and all losses that we may suffer because of your breach of (a)\nthis section, (b) any third party’s intellectual property rights, or (c) applicable law',
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 6*ffem,
                      fontWeight: FontWeight.w700,
                      height: 1.5*ffem/fem,
                      color: const Color(0xff428adc),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16*fem),
              Row(
                children: [
                  Checkbox(
                    value: _isChecked,
                    onChanged: (value) {
                      setState(() {
                        _isChecked = value ?? false;
                      });
                    },
                  ),
                  Text('Please read and accept the terms and \n conditions to continue using our app'
                    ,
                    style: SafeGoogleFont (
                      'Poppins',
                      fontSize: 10*ffem,
                      fontWeight: FontWeight.w500,

                      color: const Color(0xff428adc),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 26*fem),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style:
                    ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      minimumSize: MaterialStateProperty.all(Size(100*fem, 34*fem)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36*fem),
                        ),

                      ),
                    ),
                    child: Text(
                        'Decline',
                      style:  SafeGoogleFont (
                        'Poppins',
                        fontSize: 13*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.4*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  ),ElevatedButton(
                    onPressed: _isChecked ? () {
                      setState(() {
                        Navigator.push(
                            context, MaterialPageRoute(
                            builder: (context)=>  ClientPayemnt(widget.userModel,widget.cProfile,widget.userDetail,widget.userAddress,widget.idFront,widget.idBack)
                        ));
                      });

                    }: null,
                    style:
                    ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      //   backgroundColor: MaterialStateProperty.all(Color(0xff428adc)),
                      minimumSize: MaterialStateProperty.all(Size(100*fem, 34*fem)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(36*fem),
                        ),

                      ),
                    ),
                    child: Text(
                      'Accept',
                      style:  SafeGoogleFont (
                        'Poppins',
                        fontSize: 13*ffem,
                        fontWeight: FontWeight.w500,
                        height: 1.4*ffem/fem,
                        color: const Color(0xffffffff),
                      ),
                    ),
                  )
                ],
              ),
              ],

          ),
        ),
      ),
    );
  }
}
