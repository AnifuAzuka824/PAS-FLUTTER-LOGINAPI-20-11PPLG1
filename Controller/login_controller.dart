import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../Pages/main_menu_page.dart';

class LoginController extends GetxController {
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxBool isPasswordHidden = true.obs;

  static const String urlLogin = 'https://mediadwi.com/api/latihan/login';

  void togglePassword() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  Future<void> login() async {
    final String username = txtUsername.text.trim();
    final String password = txtPassword.text.trim();

    if (username.isEmpty || password.isEmpty) {
      _tampilkanPesan('Username dan password wajib diisi.');
      return;
    }

    isLoading.value = true;

    try {
      final http.Response response = await http.post(
        Uri.parse(urlLogin),
        body: {'username': username, 'password': password},
      );

      final Map<String, dynamic> data =
          json.decode(response.body) as Map<String, dynamic>;
      final bool berhasil = data['status'] == true;

      if (berhasil) {
        isLoading.value = false;
        Get.off(() => MainMenuPage());
        return;
      }

      _tampilkanPesan(_pesanDariServer(data));
    } catch (_) {
      _tampilkanPesan(
        'Tidak dapat terhubung ke server. Periksa koneksi internet.',
      );
    }

    isLoading.value = false;
  }

  String _pesanDariServer(Map<String, dynamic> data) {
    final dynamic pesan = data['message'];
    if (pesan is String && pesan.isNotEmpty) {
      return pesan;
    }
    return 'Username atau password salah.';
  }

  void _tampilkanPesan(String pesan) {
    Get.snackbar(
      'Login Gagal',
      pesan,
      backgroundColor: const Color(0xFFB3261E),
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(16),
      borderRadius: 12,
      duration: const Duration(seconds: 3),
    );
  }

  @override
  void onClose() {
    txtUsername.dispose();
    txtPassword.dispose();
    super.onClose();
  }
}
