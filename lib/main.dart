import 'package:flutter/material.dart';
import 'package:flutter_application_2/NewHomePage/Components/homepage_and_bottom_bar.dart';
import 'package:flutter_application_2/controller/cartPageController/cart_controller.dart';
import 'package:flutter_application_2/models/product.dart';
import 'package:flutter_application_2/profile/privacyPolicy.dart';
import 'package:flutter_application_2/profile/profilePage.dart';
import 'package:flutter_application_2/views/CartScreen/cartpage.dart';
import 'package:flutter_application_2/views/IntroScreen/P_view.dart';
import 'package:flutter_application_2/views/IntroScreen/login.dart';
import 'package:flutter_application_2/views/IntroScreen/register.dart';
import 'package:flutter_application_2/views/MyOrderPage/my_order_page.dart';
import 'package:flutter_application_2/views/favoritePage/favorite_page.dart';
import 'package:flutter_application_2/views/reports_page/reports_page.dart';
import 'package:flutter_application_2/views/showProduct/show_product.dart';
import 'package:get/get.dart';
import 'locale/locale.dart';

final controller = Get.put(CartController(), permanent: true);
List<Product> cartProducts = [];
void main() {
  runApp(const PharmacyMobileApp());
}

Color w = Colors.white;
Color b = Colors.black;
Color bg = const Color(0xFFEFE3D7);
Color bga = const Color.fromRGBO(248, 236, 210, 1);
Color gra = const Color.fromARGB(255, 222, 219, 219);
Color gr = Colors.grey;
Color r = Colors.red;

class PharmacyMobileApp extends StatelessWidget {
  const PharmacyMobileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      initialRoute: '/MainPage',
      locale: Get.deviceLocale,
      translations: MyLocale(),
      getPages: [
        GetPage(name: '/ShowProduct', page: () => const ShowProduct()),
        GetPage(name: '/FavoritePage', page: () => FavoritePage()),
        GetPage(name: '/login', page: () => Login()),
        GetPage(name: "/register", page: () => Register()),
        GetPage(name: "/cartpage", page: () => CartPage()),
        GetPage(name: "/p_view", page: () => PView()),
        //GetPage(name: "/homepage", page: () => const NewHomePage()),
        GetPage(name: "/MainPage", page: () => const MyHomePage2()),
        GetPage(name: "/profilePage", page: () => ProfilePage()),
        GetPage(name: "/PrivacyPolicy", page: () => const PrivacyPolicy()),
        GetPage(name: "/MyOrder", page: () =>  MyOrder()),
        GetPage(name: "/ReportsPage", page: () =>  ReportsPage()),
      ],
      
    );
  }
}
