import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:strong_security/model/company.dart';


class RememberCompanyPref{
  static Future<void> storeCompanyInfo(Company companyInfo) async{

    SharedPreferences preferences = await SharedPreferences.getInstance();
    String companyJsonData =  jsonEncode(companyInfo.toJson());
    await preferences.setString("currentCompany", companyJsonData);

  }
  //get user info
   static Future<Company?> readCompanyInfo() async
   {
        Company? currentCompanyInfo;
        SharedPreferences preferences = await SharedPreferences.getInstance();
       String? companyInfo = preferences.getString("currentCompany");
       if(companyInfo != null){
         Map<String, dynamic> companyDataMap = jsonDecode(companyInfo);
         currentCompanyInfo =Company.fromJson(companyDataMap);
       }
       return currentCompanyInfo;
   }
   static Future<void> removeCompanyInfo() async{
     SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.remove("currentCompany");
   }
}