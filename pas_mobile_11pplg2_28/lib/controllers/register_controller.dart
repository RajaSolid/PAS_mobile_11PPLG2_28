import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:pas_mobile_11pplg2_28/models/register_model.dart';
import 'package:pas_mobile_11pplg2_28/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegisterController extends GetxController {
  final TextEditingController fullnamecontroller = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();

  var isApiLoading = false.obs;

  Registermodel? registermodel;

  final String baseUrl = "https://mediadwi.com/api/latihan/register-user";


  Future<void> register() async {
    isApiLoading.value = true;

    final fullname = fullnamecontroller.text.trim();
    final username = usernameController.text.trim();
    final password = passwordController.text.trim();
    final email = emailcontroller.text.trim();

    try {
      final response = await http.post(
        Uri.parse(baseUrl),
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: {"username": username, "password": password, "full_name":fullname, "email":email},
      );

      print("=== RESPONSE BODY ===");
      print(response.body);

      final data = jsonDecode(response.body);
      registermodel = Registermodel.fromJson(data);

      if (response.statusCode == 200 && (registermodel?.status ?? false)) {
        final prefs = await SharedPreferences.getInstance();

        await prefs.setString('username', username);
        await prefs.setString('email', "$username@example.com");

        Get.snackbar("Register Berhasil", registermodel?.message ?? '');
        Get.offAllNamed(AppRoutes.home);
      } else {
        Get.snackbar("Register Gagal", registermodel?.message ?? "Terjadi kesalahan");
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
