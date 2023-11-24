import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../model/driver.dart';
import '../../../model/user.dart';
import 'driverPreference.dart';

class CurrentDriver extends GetxController {
  Rx<Driver> _currentDriver = Driver(0, "", "", "", "", "", "").obs;
  Driver get driver => _currentDriver.value;

  getDriverInfo() async {
    Driver? getInfoFromLocalStorage = await RememberDriverPref.readDriverInfo();
    if (getInfoFromLocalStorage != null) {
      _currentDriver.value = getInfoFromLocalStorage;
    }
  }
}
