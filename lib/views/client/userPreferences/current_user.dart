import 'package:get/get.dart';
import 'package:strong_security/views/client/userPreferences/user_preferences.dart';
import 'package:cross_file/src/types/io.dart' as cross_file_io; // Import with a prefix
import '../../../model/user.dart';

class CurrentUser extends GetxController {
  Rx<User> _currentUser = User(0, "", "", "", "", "", "").obs;
  User get user => _currentUser.value;

  getUserInfo() async {
    User? getInfoFromLocalStorage = await RememberUserPref.readUserInfo();
    if (getInfoFromLocalStorage != null) {
      _currentUser.value = getInfoFromLocalStorage;
    }
  }
}
