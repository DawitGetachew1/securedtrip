import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:strong_security/model/driver.dart';

import '../../../model/user.dart';

class RememberDriverPref{
  static Future<void> storeDriverInfo(Driver driverInfo) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String userJsonData =  jsonEncode(driverInfo.toJson());
    await preferences.setString("currentDriver", userJsonData);

  }
  //get user info
  static Future<Driver?> readDriverInfo() async
  {
    Driver? currentDriverInfo;
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String? userInfo = preferences.getString("currentDriver");
    if(userInfo != null){
      Map<String, dynamic> userDataMap = jsonDecode(userInfo);
      currentDriverInfo =Driver.fromJson(userDataMap);
    }
    return currentDriverInfo;
  }
  static Future<void> removeDriverInfo() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentDriver");
  }
}