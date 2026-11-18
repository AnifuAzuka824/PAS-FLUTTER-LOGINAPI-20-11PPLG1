import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Controller/main_menu_controller.dart';
import '../Models/menu_item_model.dart';

class MainMenuPage extends StatelessWidget {
  MainMenuPage({super.key});

  final MainMenuController controller = Get.put(MainMenuController());

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: const Color(0xFFF7F3EC),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1F1B16),
          foregroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 20,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Dapur Nusantara',
                style: TextStyle(fontSize: 12, color: Color(0xFFC9BFB2)),
              ),
              const SizedBox(height: 2),
              Text(
                controller.pageTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        body: IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.listPages,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.selectedIndex.value,
          onTap: controller.changedPage,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFFE85D3D),
          unselectedItemColor: const Color(0xFF9C948A),
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
          items: List.generate(controller.listMenu.length, (index) {
            final MenuItemModel item = controller.listMenu[index];
            IconData ikon = item.icon;
            if (index == controller.selectedIndex.value) {
              ikon = item.activeIcon;
            }
            return BottomNavigationBarItem(icon: Icon(ikon), label: item.label);
          }),
        ),
      ),
    );
  }
}
