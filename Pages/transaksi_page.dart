import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controller/transaksi_controller.dart';
import '../Models/makanan_model.dart';

class TransaksiPage extends StatelessWidget {
  TransaksiPage({super.key});

  final TransaksiController controller = Get.put(TransaksiController());

  @override
  Widget build(BuildContext context) {
    final MakananModel? makanan = controller.makanan.value;

    if (makanan == null) {
      return Scaffold(
        backgroundColor: const Color(0xFFF7F3EC),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1F1B16),
          foregroundColor: Colors.white,
          elevation: 0,
          title: const Text('Transaksi Pembelian'),
        ),
        body: const Center(child: Text('Belum ada makanan yang dipilih.')),
      );
    }

    return Scaffold(
      backgroundColor: const Color(0xFFF7F3EC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F1B16),
        foregroundColor: Colors.white,
        elevation: 0,
        title: const Text('Transaksi Pembelian'),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                makanan.gambar,
                height: 210,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: const BorderSide(color: Color(0xFFEDE6DB)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      makanan.nama,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1B16),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      makanan.deskripsi,
                      style: const TextStyle(
                        fontSize: 13,
                        height: 1.5,
                        color: Color(0xFF6B6259),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Text(
                          makanan.hargaRupiah,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFE85D3D),
                          ),
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          '/ porsi',
                          style: TextStyle(
                            fontSize: 12,
                            color: Color(0xFF9C948A),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Card(
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
                side: const BorderSide(color: Color(0xFFEDE6DB)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Jumlah Porsi',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1B16),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F3EC),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: IconButton(
                            onPressed: controller.kurangi,
                            icon: const Icon(Icons.remove),
                            color: const Color(0xFF1F1B16),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: controller.txtJumlah,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1F1B16),
                            ),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xFFF7F3EC),
                              contentPadding: const EdgeInsets.symmetric(
                                vertical: 14,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(14),
                                borderSide: BorderSide.none,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xFFF7F3EC),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: IconButton(
                            onPressed: controller.tambah,
                            icon: const Icon(Icons.add),
                            color: const Color(0xFF1F1B16),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      'Subtotal, PPN 5%, dan total bayar dihitung saat tombol Bayar ditekan.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: Color(0xFF9C948A),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 54,
              child: ElevatedButton.icon(
                onPressed: controller.bayar,
                icon: const Icon(Icons.receipt_long_outlined, size: 20),
                label: const Text('Bayar'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFE85D3D),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
