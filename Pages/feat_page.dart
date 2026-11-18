import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Compounent/banner_judul.dart';
import '../Compounent/team_card.dart';
import '../Controller/feat_controller.dart';

class FeatPage extends StatelessWidget {
  FeatPage({super.key});

  final FeatController controller = Get.put(FeatController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Center(
          child: CircularProgressIndicator(color: Color(0xFFE85D3D)),
        );
      }

      if (controller.pesanError.value.isNotEmpty) {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.cloud_off_outlined,
                size: 56,
                color: Color(0xFF9C948A),
              ),
              const SizedBox(height: 14),
              Text(
                controller.pesanError.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6B6259),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 18),
              FilledButton.icon(
                onPressed: controller.ambilDataTeam,
                icon: const Icon(Icons.refresh),
                label: const Text('Coba Lagi'),
                style: FilledButton.styleFrom(
                  backgroundColor: const Color(0xFFE85D3D),
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        );
      }

      return ListView.builder(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
        itemCount: controller.listTeam.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return BannerJudul(
              judul: 'Premier League',
              subjudul:
                  '${controller.listTeam.length} klub peserta English Premier League musim ini.',
              ikon: Icons.emoji_events,
            );
          }

          return TeamCard(team: controller.listTeam[index - 1]);
        },
      );
    });
  }
}
