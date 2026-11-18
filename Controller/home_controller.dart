import 'package:get/get.dart';

import '../Models/makanan_model.dart';
import '../routes.dart';

class HomeController extends GetxController {
  final Rx<MakananModel?> makananTerpilih = Rx<MakananModel?>(null);

  final List<MakananModel> listMakanan = const [
    MakananModel(
      id: 1,
      nama: 'Nasi Goreng Spesial',
      harga: 25000,
      deskripsi: 'Nasi goreng bumbu rempah dengan telur mata sapi, ayam suwir, dan kerupuk.',
      gambar: 'assets/img/nasi_goreng.png',
    ),
    MakananModel(
      id: 2,
      nama: 'Ayam Bakar Madu',
      harga: 30000,
      deskripsi: 'Ayam bakar olesan madu murni lengkap dengan sambal terasi dan lalapan.',
      gambar: 'assets/img/ayam_bakar.png',
    ),
    MakananModel(
      id: 3,
      nama: 'Sate Ayam Madura',
      harga: 28000,
      deskripsi: '10 tusuk sate ayam daging pilihan dengan siraman bumbu kacang kental.',
      gambar: 'assets/img/sate_ayam.png',
    ),
    MakananModel(
      id: 4,
      nama: 'Mie Ayam Bakso',
      harga: 20000,
      deskripsi: 'Mie kenyal dengan topping ayam kecap, sawi hijau, dan 2 butir bakso sapi.',
      gambar: 'assets/img/mie_ayam.png',
    ),
    MakananModel(
      id: 5,
      nama: 'Es Teh Manis Jumbo',
      harga: 8000,
      deskripsi:
          'Minuman teh melati segar dengan gula asli dan es batu kristal.',
      gambar: 'assets/img/es_teh.png',
    ),
  ];

  void pilihMakanan(MakananModel makanan) {
    makananTerpilih.value = makanan;
    Get.toNamed(Routes.transaksi);
  }
}
