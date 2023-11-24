import 'package:get/get.dart';

import '../../../model/company.dart';
import 'company_preferences.dart';

class CurrentCompany extends GetxController{

  Rx<Company> _currentCompany =  Company(0,"","","","","").obs;
  Company get company => _currentCompany.value;
  getCompanyInfo ()async{
    Company? getInfoFromLocalStorage = await RememberCompanyPref.readCompanyInfo();
    _currentCompany.value =getInfoFromLocalStorage!;
  }
}