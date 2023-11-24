class Company{
  int company_id;
  String company_name;
  String user_name;
  String company_email;
  String phone_number;
  String company_password;

  Company(
      this.company_id,
      this.company_name,
      this.user_name,
      this.phone_number,
      this.company_email,
      this.company_password,
      );

  factory  Company.fromJson(Map<String, dynamic> json )=> Company(
    int.tryParse(json["company_id"].toString()) ?? 0,
    json["company_name"]?? '',
    json["user_name"]?? '',
    json["phone_number"]?? '',
    json["company_email"]?? '',
    json["company_password"]?? '',

  );


  Map<String, dynamic> toJson()=>
      {
        'company_id': company_id.toString(),
        'company_name': company_name,
        'user_name': user_name,
        'phone_number': phone_number,
        'company_email': company_email,
        'company_password': company_password,
      };
}