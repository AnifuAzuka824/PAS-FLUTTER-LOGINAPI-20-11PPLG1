import 'package:aplication_flutter_pas/Controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final LoginController controller = Get.put(LoginController());

  static const Color latar = Color(0xFF0F0E0C);
  static const Color permukaan = Color(0xFF1B1916);
  static const Color garis = Color(0xFF322E29);
  static const Color aksen = Color(0xFFE85D3D);
  static const Color teksAbu = Color(0xFF9C948A);

  InputDecoration _gayaField({
    required String label,
    required String hint,
    Widget? suffixIcon,
  }) {
    final OutlineInputBorder border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: garis),
    );

    return InputDecoration(
      labelText: label,
      hintText: hint,
      labelStyle: const TextStyle(color: teksAbu, fontSize: 14),
      hintStyle: const TextStyle(color: teksAbu, fontSize: 14),
      suffixIcon: suffixIcon,
      filled: true,
      fillColor: permukaan,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
      border: border,
      enabledBorder: border,
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(color: aksen, width: 1.6),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: latar,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 440),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          color: aksen,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const Icon(
                          Icons.restaurant_menu,
                          color: Colors.white,
                          size: 28,
                        ),
                      ),
                      const SizedBox(width: 14),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dapur Nusantara',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 3),
                          Text(
                            'Kuliner & Liga Inggris',
                            style: TextStyle(color: teksAbu, fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 44),
                  const Text(
                    'Masuk ke akunmu',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Pesan makanan favorit dan pantau klub Premier League dalam satu aplikasi.',
                    style: TextStyle(color: teksAbu, fontSize: 14, height: 1.5),
                  ),
                  const SizedBox(height: 32),
                  TextField(
                    controller: controller.txtUsername,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    cursorColor: aksen,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                    decoration: _gayaField(
                      label: 'Username',
                      hint: 'Masukkan username',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    bool tersembunyi = controller.isPasswordHidden.value;
                    IconData ikon = Icons.visibility_outlined;
                    if (tersembunyi) {
                      ikon = Icons.visibility_off_outlined;
                    }

                    return TextField(
                      controller: controller.txtPassword,
                      obscureText: tersembunyi,
                      cursorColor: aksen,
                      style: const TextStyle(color: Colors.white, fontSize: 15),
                      onSubmitted: (value) => controller.login(),
                      decoration: _gayaField(
                        label: 'Password',
                        hint: 'Masukkan password',
                        suffixIcon: IconButton(
                          onPressed: controller.togglePassword,
                          icon: Icon(ikon, color: teksAbu, size: 20),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 12),
                  const Row(
                    children: [
                      Icon(Icons.info_outline, size: 14, color: teksAbu),
                      SizedBox(width: 6),
                      Text(
                        'Akun demo: admin123 / admin123',
                        style: TextStyle(color: teksAbu, fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
                  Obx(() {
                    if (controller.isLoading.value) {
                      return Container(
                        height: 54,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: permukaan,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: garis),
                        ),
                        child: const SizedBox(
                          width: 22,
                          height: 22,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.4,
                            color: aksen,
                          ),
                        ),
                      );
                    }

                    return SizedBox(
                      height: 54,
                      child: ElevatedButton(
                        onPressed: controller.login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: aksen,
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
                        child: const Text('Masuk'),
                      ),
                    );
                  }),
                  const SizedBox(height: 36),
                  const Center(
                    child: Text(
                      'PAS Genap 2025/2026  -  11 PPLG 1',
                      style: TextStyle(color: teksAbu, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
