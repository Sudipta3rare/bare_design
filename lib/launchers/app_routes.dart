import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../views/ui/home_model/dashboard_page.dart';
import '../views/ui/splash_module/splash_screen.dart';

class AppRoutes {

  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const SplashPage()),
    GetPage(name: '/dashboard', page: () => const DashboardPage(),transition: Transition.fade),
    // GetPage(name: '/intro', page: () => const IntroPage()),
    // GetPage(name: '/auth', page: () => const AuthPage()),
    // GetPage(name: '/login', page: () => const LoginPage()),
    // GetPage(name: '/dashboard', page: () => const DashboardPage()),
    // GetPage(name: '/orders', page: () =>  const ListOrders(), transition: Transition.fade),
    // GetPage(name: '/order-status', page: () =>  const ListOrderStatus(), transition: Transition.fade),
    // GetPage(name: '/order', page: () =>  const SingleOrder(), transition: Transition.fade),
  ];
}