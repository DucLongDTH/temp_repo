
class APICons {
  static String baseURL = '';
  static String login = "login";
}

class APIParams {
  static String email = "email";
  static String password = "password";
  static String api = "api";
  static String autoLogin = "autoLogin";
  static String deviceType = "deviceType";
  static String applicationName = "applicationName";
  static String pushNotificationToken = "pushNotificationToken";
  static String deviceId = "deviceId";
  static String code = "code";
  static String status = "status";
}

class KeyPreference {
  static String loginUser = "login_user";
}

class ErrorCode {
  static const int jsonError = -2;
  static const int networkError = -1;
  static const int success = 200;
  static const int serverError = 502;
  static const double connectServer = 1.1;
  static const int tokenExpired = 3;
  static const double maintain = 1.2;
}
