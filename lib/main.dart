import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'package:get/get.dart';
import 'package:ionmobile/app_controller.dart';
import 'package:ionmobile/constants/theme_provider.dart';
import 'package:ionmobile/data/services/message_service.dart';
import 'package:ionmobile/routes/app_pages.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'localizations/location.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AppController());
  Get.lazyPut(() => MessageService());
  await Supabase.initialize(
      url: 'https://thiqmzvfnkysugawxdqd.supabase.co',
      anonKey:
          'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InRoaXFtenZmbmt5c3VnYXd4ZHFkIiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODI0NzgxODYsImV4cCI6MTk5ODA1NDE4Nn0.WLaGAxw2i1OeswLmqBw48RECZLvYRjj4eSFXuu4kzJA');
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    configLoading();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: ThemeProvider.bgScreen,
      systemNavigationBarColor: ThemeProvider.bgScreen,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return GetMaterialApp(
      theme: ThemeData.dark(),
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
      fallbackLocale: LocalizationService.fallbackLocale,
      debugShowCheckedModeBanner: false,
      translations: LocalizationService(), // your translations
      // locale: Locale('id', 'ID'),
    );
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.custom
      ..indicatorSize = 30.0
      ..radius = 10.0
      ..progressColor = Colors.black
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.black
      ..textColor = Colors.black
      ..maskColor = Colors.black.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;
  }
}
