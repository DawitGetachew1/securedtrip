class CompanyInf{
String companyVat;
String companyTin;
String companyLicence;



CompanyInf(
    this.companyVat,
    this.companyTin,
    this.companyLicence,
    );




Map<String, dynamic> toJson()=>
    {

      'companyVat':  companyVat,
      'companyTin': companyTin,
      'companyLicence': companyLicence
    };
}