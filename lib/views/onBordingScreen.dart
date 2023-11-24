import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:strong_security/main.dart';


import 'package:strong_security/views/intropage2.dart';
import 'intropage1.dart';
import '../size_config.dart';

class OnBordingScreen extends StatefulWidget {
   const OnBordingScreen({super.key});

  @override
  State<OnBordingScreen> createState() => _OnBordingScreenState();
}

class _OnBordingScreenState extends State<OnBordingScreen> {
  @override
  Future setSeenOnboard() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    seenOnboard = await pref.setBool('seenOnboard', true);
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
    setSeenOnboard();
  }
  void initialize()async{
   await Future.delayed(const Duration(seconds: 1));
   FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double sizeH = SizeConfig.blockSizeH!;
    double sizeV = SizeConfig.blockSizeV!;
    return Scaffold(
      backgroundColor: Colors.white,
      body:SafeArea(
        child:PageView.builder(
        //  padEnds: false,
          itemCount: 2,
            itemBuilder: (context,index)
            {
              if(index==0){
                return const Intropage1();
              }
              else if(index == 1){
                return const IntroPage2();
              }
              return null;
            }

        )
      ),
    );

  }
}

