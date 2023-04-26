import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/main/bindings/main_binding.dart';
import '../modules/main/views/main_view.dart';
import '../modules/notification_screen/bindings/notification_screen_binding.dart';
import '../modules/notification_screen/views/notification_screen_view.dart';
import '../modules/personal/bindings/personal_binding.dart';
import '../modules/personal/views/personal_view.dart';
import '../modules/provide_fullname/bindings/provide_fullname_binding.dart';
import '../modules/provide_fullname/views/provide_fullname_view.dart';
import '../modules/select_language/bindings/select_language_binding.dart';
import '../modules/select_language/views/select_language_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/verify_authcode/bindings/verify_authcode_binding.dart';
import '../modules/verify_authcode/views/verify_authcode_view.dart';
import '../modules/webscreen/bindings/webscreen_binding.dart';
import '../modules/webscreen/views/webscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.MAIN,
      page: () => MainView(),
      binding: MainBinding(),
    ),
    GetPage(
      name: _Paths.NOTIFICATION_SCREEN,
      page: () => NotificationScreenView(),
      binding: NotificationScreenBinding(),
    ),
    GetPage(
      name: _Paths.PERSONAL,
      page: () => PersonalView(),
      binding: PersonalBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.SELECT_LANGUAGE,
      page: () => SelectLanguageView(),
      binding: SelectLanguageBinding(),
    ),
    GetPage(
      name: _Paths.WEBSCREEN,
      page: () => WebscreenView(),
      binding: WebscreenBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY_AUTHCODE,
      page: () => VerifyAuthcodeView(),
      binding: VerifyAuthcodeBinding(),
      children: [
        GetPage(
          name: _Paths.VERIFY_AUTHCODE,
          page: () => VerifyAuthcodeView(),
          binding: VerifyAuthcodeBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.PROVIDE_FULLNAME,
      page: () => ProvideFullnameView(),
      binding: ProvideFullnameBinding(),
    ),
  ];
}
