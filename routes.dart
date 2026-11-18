import 'package:get/get.dart';

import 'Pages/feat_page.dart';
import 'Pages/home_page.dart';
import 'Pages/main_menu_page.dart';
import 'Pages/profile_page.dart';
import 'Pages/transaksi_page.dart';
import 'login_page.dart';

class Routes {
  static const String login = '/login';
  static const String mainMenu = '/main-menu';
  static const String home = '/home';
  static const String feat = '/feat';
  static const String profile = '/profile';
  static const String transaksi = '/transaksi';

  static final List<GetPage> pages = [
    GetPage(name: login, page: () => LoginPage()),
    GetPage(name: mainMenu, page: () => MainMenuPage()),
    GetPage(name: home, page: () => HomePage()),
    GetPage(name: feat, page: () => FeatPage()),
    GetPage(name: profile, page: () => const ProfilePage()),
    GetPage(name: transaksi, page: () => TransaksiPage()),
  ];
}
