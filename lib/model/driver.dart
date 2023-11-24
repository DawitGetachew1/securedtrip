

import 'package:image_picker/image_picker.dart';

class Driver{
  int did;
  String dFirst;
  String dLast;
  String dPhone;
  String dUserName;
  String dEmail;
  String dPassword;



  Driver(
      this.did,
      this.dFirst,
      this.dLast,
      this.dPhone,
      this.dUserName,
      this.dEmail,
      this.dPassword,

      );

  factory Driver.fromJson(Map<String, dynamic> json )=> Driver(
    int.tryParse(json["did"].toString()) ?? 0,
    json["dFirst"]?? '',
    json["dLast"]?? '',
    json["dUserName"]?? '',
    json["dPhone"]?? '',
    json["dEmail"]?? '',
    json["dPassword"]?? '',


  );


  Map<String, dynamic> toJson()=>
      {
        'did': did.toString(),
        'dFirst':  dFirst,
        'dLast': dLast,
        'dUserName': dUserName,
        'dPhone': dPhone,
        'dEmail': dEmail,
        'dPassword': dPassword,
      };

}