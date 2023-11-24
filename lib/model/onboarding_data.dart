import 'package:flutter/cupertino.dart';

import '../size_config.dart';

class OnBording extends StatelessWidget{
  String desc= '';
  String image = '';
  String title = '';
 OnBording({super.key, required this.title, required this.desc,required this.image});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Placeholder();
    throw UnimplementedError();
  }
}
  List<OnBording> onBordingContents = [
    OnBording(
        title: 'WELCOME',
        desc:'TWO Z BUSINESS PLC DIGITAL SYSTEMS' ,
        image:'images/image1.png'

    ),
    OnBording(
        title: 'STRONG SECURITY',
        desc:'FROM THE COMPANY TWO Z' ,
        image:'images/images.png'
    )
  ];
Color kPrimaryColor = const Color.fromRGBO(8,146,208,80);
final List<TextStyle> pageTextStyles = [

  TextStyle(
      fontFamily: 'Poppins',
      fontSize: SizeConfig.blockSizeH! * 13.5,
      color: kPrimaryColor,
      fontWeight: FontWeight.w700
  ),
  TextStyle(
      fontFamily: 'Poppins',
      fontSize: SizeConfig.blockSizeH! * 8.5,
      color: kPrimaryColor,
      fontWeight: FontWeight.w700
  )
];
