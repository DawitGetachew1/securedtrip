import 'package:strong_security/model/company_Inf.dart';

import 'company.dart';

class CombinedCompanyData{
  final Company company;
  final CompanyInf companyInf;
  CombinedCompanyData(this.company,this.companyInf);
  Map<String, String> toJson() {
    return {
      'company_name': company.company_name,
      'companyUser': company.user_name,
      'phone_number': company.phone_number,
      'company_email': company.company_email,
      'company_password': company.company_password,
      'companyVat':  companyInf.companyVat,
      'companyTin': companyInf.companyTin,
      'companyLicence': companyInf.companyLicence
    };
  }
}