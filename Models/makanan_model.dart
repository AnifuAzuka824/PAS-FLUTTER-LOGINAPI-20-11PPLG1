import '../utils/rupiah.dart';

class MakananModel {
  final int id;
  final String nama;
  final int harga;
  final String deskripsi;
  final String gambar;

  const MakananModel({
    required this.id,
    required this.nama,
    required this.harga,
    required this.deskripsi,
    required this.gambar,
  });

  String get hargaRupiah => formatRupiah(harga);
}
