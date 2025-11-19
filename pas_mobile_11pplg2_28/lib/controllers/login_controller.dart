import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_28/models/login_model.dart';
import 'package:pas_mobile_11pplg2_28/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginAPIController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  var isApiLoading = false.obs;

  Loginmodel? loginModel;

  final String baseUrl = "https://mediadwi.com/api/latihan/login";


  Future<void> login() async {
    isApiLoading.value = true;

    final username = usernameController.text.trim();
    final password = passwordController.text.trim();

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"username": username, "password": password},
      );

      print("=== RESPONSE BODY ===");
      print(response.body);

      final data = jsonDecode(response.body);
      loginModel = Loginmodel.fromJson(data);

      if (response.statusCode == 200 && (loginModel?.status ?? false)) {
        final prefs = await SharedPreferences.getInstance();

        // Simpan data login
        if (loginModel?.token != null) {
          await prefs.setString('token', loginModel!.token);
        }

        await prefs.setString('username', username);
        await prefs.setString('email', "$username@example.com");

        Get.snackbar("Login Berhasil", loginModel?.message ?? '');
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar("Login Gagal", loginModel?.message ?? "Terjadi kesalahan");
      }
    } catch (e) {
      Get.snackbar("Exception", e.toString());
    } finally {
      isApiLoading.value = false;
    }
  }
  
  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
