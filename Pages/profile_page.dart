import 'package:flutter/material.dart';

import '../Compounent/info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  static const String nama = 'M. Anif Azka R.';
  static const String kelas = 'XI PPLG 1';
  static const String noAbsen = '-';
  static const String bio =
      'Siswa SMK jurusan Pengembangan Perangkat Lunak dan Gim yang senang membangun aplikasi mobile dengan Flutter.';

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 28),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF1F1B16), Color(0xFF4A382C)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(28),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFFF2B84B), width: 3),
                ),
                child: const CircleAvatar(
                  radius: 52,
                  backgroundImage: AssetImage('assets/img/avatar.png'),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                nama,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                'Mobile Developer Pemula',
                style: TextStyle(color: Color(0xFFCFC5B8), fontSize: 13),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x33FFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      children: [
                        Icon(
                          Icons.school_outlined,
                          size: 14,
                          color: Color(0xFFF2B84B),
                        ),
                        SizedBox(width: 6),
                        Text(
                          kelas,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0x33FFFFFF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.tag,
                          size: 14,
                          color: Color(0xFFF2B84B),
                        ),
                        const SizedBox(width: 6),
                        Text(
                          'No. Absen $noAbsen',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
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
          child: const Padding(
            padding: EdgeInsets.fromLTRB(18, 18, 18, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Identitas',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1F1B16),
                  ),
                ),
                SizedBox(height: 8),
                InfoTile(
                  icon: Icons.badge_outlined,
                  label: 'Nama Lengkap',
                  value: nama,
                ),
                InfoTile(
                  icon: Icons.school_outlined,
                  label: 'Kelas',
                  value: kelas,
                ),
                InfoTile(
                  icon: Icons.pin_outlined,
                  label: 'No. Absen',
                  value: noAbsen,
                ),
                InfoTile(
                  icon: Icons.flutter_dash,
                  label: 'Framework',
                  value: 'Flutter + GetX',
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
          child: const Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.auto_awesome_outlined,
                      size: 18,
                      color: Color(0xFFE85D3D),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Tentang Saya',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1F1B16),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  bio,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.6,
                    color: Color(0xFF6B6259),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 24),
        const Center(
          child: Text(
            'Dibuat untuk PAS Genap 2025/2026',
            style: TextStyle(fontSize: 12, color: Color(0xFF9C948A)),
          ),
        ),
      ],
    );
  }
}
