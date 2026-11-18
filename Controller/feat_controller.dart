import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Models/team_model.dart';

class FeatController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString pesanError = ''.obs;
  final RxList<Team> listTeam = <Team>[].obs;

  static const String urlTeams =
      'https://www.thesportsdb.com/api/v1/json/123/search_all_teams.php?l=English%20Premier%20League';

  @override
  void onInit() {
    super.onInit();
    ambilDataTeam();
  }

  Future<void> ambilDataTeam() async {
    isLoading.value = true;
    pesanError.value = '';

    try {
      final http.Response response = await http.get(Uri.parse(urlTeams));

      if (response.statusCode != 200) {
        pesanError.value = 'Server mengembalikan kode ${response.statusCode}.';
        isLoading.value = false;
        return;
      }

      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;

      if (data['teams'] == null) {
        listTeam.clear();
        pesanError.value = 'Data klub tidak ditemukan.';
      } else {
        final PremierLeagueModel model = premierLeagueModelFromJson(
          response.body,
        );
        listTeam.assignAll(model.teams);
      }
    } catch (_) {
      pesanError.value =
          'Gagal mengambil data klub. Periksa koneksi internet lalu coba lagi.';
    }

    isLoading.value = false;
  }
}
