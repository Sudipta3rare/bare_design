import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../views/components/loading.dart';
import 'app_routes.dart';
class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ThemeController.to.getThemeModeFromStore();
    // WelcomeController.to.getFirstInstall();
    // AuthController.to.getAuthCode();
    return Loading(
      child: GetMaterialApp(
        // translations: Localization(),
        // locale: languageController.getLocale, // <- Current locale
        navigatorObservers: const [
        ],
        debugShowCheckedModeBanner: false,

        themeMode: ThemeMode.system,
        initialRoute: "/",
        getPages: AppRoutes.routes,
      ),

    );
  }
}
