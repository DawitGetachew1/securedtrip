class API {
  static const hostConnect = "https://security.secured-trip.com/mobilapiv1/";
  static const hostConnectUser = "$hostConnect/user";
  static const hostConnectCompany = "$hostConnect/company";
  static const hostConnectDriver = "$hostConnect/driver";
  static const hostConnectPass = "$hostConnect/passanger";

  // signup Client
  static const signUpClient = "$hostConnectUser/signup.php";
  static const validiateEmailClient = "$hostConnectUser/validate_email.php";
  static const loginClient = "$hostConnectUser/login.php";
  static const verifyOtpClient = "$hostConnectUser/verifyOtp.php";
  static const transportClient = "$hostConnectUser/transport.php";
  static const transportSecurity = "$hostConnectUser/transportSecurity.php";
  static const securityClient = "$hostConnectUser/security.php";
  // signup Company
  static const signUpCompany = "$hostConnectCompany/signupCompany.php";
  static const validiateEmailCompany = "$hostConnectCompany/validate_emailComp.php";
  static const loginCompany = "$hostConnectCompany/loginCompany.php";
  static const verifyOtpCompany = "$hostConnectCompany/verifyOtpComp.php";
  static const hrManage = "$hostConnectCompany/hrManage.php";
  static const validateHrEmail = "$hostConnectCompany/validateHrEmail.php";
  // login driver
  static const loginDriver = "$hostConnectDriver/loginDriver.php";
  static const updateToggle = "$hostConnectDriver/update_toggle.php";
  static const getToggle = "$hostConnectDriver/get_toggle.php";
  // passenger
  static const pTransport = "$hostConnectPass/ptransport.php";


}
