import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:strong_security/views/authIntro.dart';
import 'package:strong_security/views/client/dashboard/clientDashboard.dart';
import 'package:strong_security/views/client/userPreferences/user_preferences.dart';
import 'package:strong_security/views/company/companyPreferences/company_preferences.dart';
import 'package:strong_security/views/company/dashboard/companyDashboard.dart';
import 'package:strong_security/views/driver/dashboard/drverDashboard.dart';
import 'package:strong_security/views/driver/sharedPreference/driverPreference.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:strong_security/views/onBordingScreen.dart';

import 'model/driver.dart';
bool? seenOnboard;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown

  ]);

  SharedPreferences pref = await SharedPreferences.getInstance();
  seenOnboard = pref.getBool('seenOnboard')?? false;
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'basic_channel',
      channelName: 'Basic notifications',
      channelDescription: 'Notification channel for basic tests',
      defaultColor: const Color(0xff428adc),
      importance: NotificationImportance.High,
      channelShowBadge: true,
    )
  ],);
  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Future<List<dynamic>> fetchData() async {
      final userPrefs = RememberUserPref.readUserInfo();
      final companyPrefs = RememberCompanyPref.readCompanyInfo();
      final driverPrefs = RememberDriverPref.readDriverInfo();
      return await Future.wait([userPrefs, companyPrefs,driverPrefs]);
    }
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title:'Secured Trip',
        theme: ThemeData(
        primaryColor: const Color.fromRGBO(0, 168, 232, 100),
        ),
        home: FutureBuilder(
          future: fetchData(),
          builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
    if (seenOnboard == true) {
    if (snapshot.connectionState == ConnectionState.waiting) {
    return CircularProgressIndicator();
    } else if (snapshot.hasError) {
    // Handle error case
    return Text('Error: ${snapshot.error}');
    } else {
    // Handle the case when snapshot.data is available
    final List<dynamic>? data = snapshot.data;
    if (data != null && data[1] != null) {
    // Use data[1] for company data
    return CompanyDashboard();
    }
    else if(data !=null && data[0]!=null){
      return ClientDashboard();
    }
    else if(data !=null && data[2] != null){
      return DriverDashboard();
    }
    else {
    // Use data[0] for user data
    return AuthenticationIntro();
    }
    }
    } else {
    // Return null if seenOnboard is false
    return OnBordingScreen();
    }
    }
        )

    );
  }
}
