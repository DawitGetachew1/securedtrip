import 'package:strong_security/model/user.dart';
import 'package:strong_security/model/user_address.dart';
import 'package:strong_security/model/user_detail.dart';

class CombinedUserData {
  final User user;
  final UserAddress userAddress;
  final UserDetail userDetail;

  CombinedUserData(this.user, this.userDetail,this.userAddress);

  Map<String, String> toJson() {
    return {
      "cFirst": user.cFirst,
      "cLast": user.cLast,
      "cUserName": user.cUserName,
      "cEmail": user.cEmail,
      "cPhone": user.cPhone,
      "cPass": user.cPass,
      "cGender": userDetail.cGender,
      "dateOfBirth": userDetail.dateOfBirth,
      "cCountry": userAddress.cCountry,
      "cRegion": userAddress.cRegion,
      "cZone": userAddress.cZone,
      "cSubCity": userAddress.cSubCity,
      "cPoBox": userAddress.cPoBox,
    };
  }
}