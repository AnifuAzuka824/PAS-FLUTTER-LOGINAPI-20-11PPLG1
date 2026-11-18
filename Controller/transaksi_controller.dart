import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Compounent/baris_rincian.dart';
import '../Models/makanan_model.dart';
import '../utils/rupiah.dart';
import 'home_controller.dart';

class TransaksiController extends GetxController {
  final Rxn<MakananModel> makanan = Rxn<MakananModel>();
  final TextEditingController txtJumlah = TextEditingController(text: '1');

  @override
  void onInit() {
    super.onInit();
    if (Get.isRegistered<HomeController>()) {
      makanan.value = Get.find<HomeController>().makananTerpilih.value;
    }
  }

  int get jumlahPorsi {
    final int? nilai = int.tryParse(txtJumlah.text);
    if (nilai == null || nilai < 1) {
      return 1;
    }
    return nilai;
  }

  int get subtotal {
    final MakananModel? item = makanan.value;
    if (item == null) {
      return 0;
    }
    return item.harga * jumlahPorsi;
  }

  int get ppn => (subtotal * 0.05).round();

  int get totalBayar => subtotal + ppn;

  void tambah() {
    txtJumlah.text = (jumlahPorsi + 1).toString();
  }

  void kurangi() {
    int nilai = jumlahPorsi - 1;
    if (nilai < 1) {
      nilai = 1;
    }
    txtJumlah.text = nilai.toString();
  }

  void bayar() {
    final MakananModel? item = makanan.value;
    if (item == null) {
      return;
    }

    Get.dialog(
      AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        title: const Text('Rincian Pembayaran'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            RincianRow(label: 'Makanan', value: item.nama),
            RincianRow(label: 'Harga', value: formatRupiah(item.harga)),
            RincianRow(label: 'Jumlah', value: '$jumlahPorsi porsi'),
            const Divider(height: 24),
            RincianRow(label: 'Subtotal', value: formatRupiah(subtotal)),
            RincianRow(label: 'PPN (5%)', value: formatRupiah(ppn)),
            const Divider(height: 24),
            RincianRow(
              label: 'Total Bayar',
              value: formatRupiah(totalBayar),
              tebal: true,
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Get.back(), child: const Text('Tutup')),
        ],
      ),
    );
  }

  @override
  void onClose() {
    txtJumlah.dispose();
    super.onClose();
  }
}
