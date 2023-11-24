

import 'package:image_picker/image_picker.dart';

class User{
  int cid;
  String cFirst;
  String cLast;
  String cUserName;
  String cPhone;
  String cEmail;
  String cPass;



  User(
      this.cid,
      this.cFirst,
      this.cLast,
      this.cUserName,
      this.cPhone,
      this.cEmail,
      this.cPass,

      );

  factory User.fromJson(Map<String, dynamic> json )=> User(
       int.tryParse(json["cid"].toString()) ?? 0,
    json["cFirst"]?? '',
    json["cLast"]?? '',
       json["cUserName"]?? '',
    json["cPhone"]?? '',
       json["cEmail"]?? '',
       json["cPass"]?? '',


  );


   Map<String, dynamic> toJson()=>
       {
         'cid': cid.toString(),
         'cFirst':  cFirst,
         'cLast': cLast,
         'cUserName': cUserName,
         'cPhone': cPhone,
         'cEmail': cEmail,
         'cPass': cPass,
       };

}