import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';

import '../personal_information.dart';
import '../views/ui/cart&wishlist_module/cart_page.dart';

import '../views/ui/cart&wishlist_module/wishlist_page.dart';
import '../views/ui/home_module/dashboard_page.dart';
import '../views/ui/product_list_module/product_list_page.dart';
import '../views/ui/splash_module/splash_screen.dart';

class AppRoutes {

  AppRoutes._(); //this is to prevent anyone from instantiating this object
  static final routes = [
    GetPage(name: '/', page: () => const SplashPage()),
    GetPage(name: '/dashboard', page: () =>  DashboardPage(),transition: Transition.fade),
    GetPage(name: '/productList', page: () => const ProductListPage(),transition: Transition.fade),
    GetPage(name: '/personal_information', page: () => PersonalInformation(),transition: Transition.fade),
    GetPage(name: '/cartPage', page: () => CartPage(),transition: Transition.fade),
    GetPage(name: '/wishlistPage', page: () => WishlistPage(),transition: Transition.fade),
    // GetPage(name: '/intro', page: () => const IntroPage()),
    // GetPage(name: '/auth', page: () => const AuthPage()),
    // GetPage(name: '/login', page: () => const LoginPage()),
    // GetPage(name: '/dashboard', page: () => const DashboardPage()),
    // GetPage(name: '/orders', page: () =>  const ListOrders(), transition: Transition.fade),
    // GetPage(name: '/order-status', page: () =>  const ListOrderStatus(), transition: Transition.fade),
    // GetPage(name: '/order', page: () =>  const SingleOrder(), transition: Transition.fade),
  ];
}