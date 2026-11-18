import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Compounent/banner_judul.dart';
import '../Compounent/makanan_card.dart';
import '../Controller/home_controller.dart';
import '../Models/makanan_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      itemCount: controller.listMakanan.length + 1,
      itemBuilder: (context, index) {
        if (index == 0) {
          return const BannerJudul(
            judul: 'Menu Hari Ini',
            subjudul: 'Pilih makanan favoritmu, atur jumlah porsi, lalu bayar dengan PPN 5%.',
            ikon: Icons.restaurant,
          );
        }

        final MakananModel makanan = controller.listMakanan[index - 1];
        return MakananCard(
          makanan: makanan,
          onTap: () => controller.pilihMakanan(makanan),
        );
      },
    );
  }
}
