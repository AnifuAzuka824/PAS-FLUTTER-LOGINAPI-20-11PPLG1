import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Models/menu_item_model.dart';
import '../Pages/feat_page.dart';
import '../Pages/home_page.dart';
import '../Pages/profile_page.dart';

class MainMenuController extends GetxController {
  final RxInt selectedIndex = 0.obs;

  final List<MenuItemModel> listMenu = const [
    MenuItemModel(
      label: 'Home',
      icon: Icons.home_outlined,
      activeIcon: Icons.home,
    ),
    MenuItemModel(
      label: 'Feat',
      icon: Icons.emoji_events_outlined,
      activeIcon: Icons.emoji_events,
    ),
    MenuItemModel(
      label: 'Profile',
      icon: Icons.person_outline,
      activeIcon: Icons.person,
    ),
  ];

  final List<Widget> listPages = [HomePage(), FeatPage(), const ProfilePage()];

  String get pageTitle => listMenu[selectedIndex.value].label;

  void changedPage(int index) {
    selectedIndex.value = index;
  }
}
