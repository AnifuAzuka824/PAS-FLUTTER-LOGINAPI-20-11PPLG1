import 'package:flutter/material.dart';

class BannerJudul extends StatelessWidget {
  final String judul;
  final String subjudul;
  final IconData ikon;

  const BannerJudul({
    super.key,
    required this.judul,
    required this.subjudul,
    required this.ikon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1F1B16), Color(0xFF3B2F27)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  judul,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  subjudul,
                  style: const TextStyle(
                    color: Color(0xFFCFC5B8),
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: const Color(0x33E85D3D),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(ikon, color: const Color(0xFFF2B84B), size: 28),
          ),
        ],
      ),
    );
  }
}
