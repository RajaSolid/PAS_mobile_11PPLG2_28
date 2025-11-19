import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_28/components/custom_textfield.dart';
import 'package:pas_mobile_11pplg2_28/controllers/register_controller.dart';
import 'package:pas_mobile_11pplg2_28/routes/routes.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController controller = Get.find<RegisterController>();

  RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: "Nama Lengkap",
              controller: controller.fullnamecontroller,
            ),
            CustomTextField(
              label: "Username",
              controller: controller.usernameController,
            ),
            CustomTextField(
              label: "Password",
              controller: controller.passwordController,
              isPassword: true,
            ),
            CustomTextField(
              label: "Email",
              controller: controller.emailcontroller,
            ),

            const SizedBox(height: 24),

            // 🔹 Tombol Register API
            Obx(() {
              return controller.isApiLoading.value
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(
                        myText: "Register dengan API",
                        myTextColor: Colors.black,
                        onPressed: controller.register,
                      ),
                    );
            }),

            const SizedBox(height: 20),

            const Row(
              children: [
                Expanded(child: Divider(thickness: 1)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text("atau"),
                ),
                Expanded(child: Divider(thickness: 1)),
              ],
            ),

            const SizedBox(height: 20),

            // 🔹 Tombol pindah ke halaman login
            SizedBox(
              width: double.infinity,
              height: 50,
              child: CustomButton(
                myText: "Sudah punya akun? Login",
                myTextColor: Colors.black,
                onPressed: () => Get.toNamed(AppRoutes.login),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
