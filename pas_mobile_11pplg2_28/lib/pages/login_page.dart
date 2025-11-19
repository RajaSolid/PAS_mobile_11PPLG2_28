import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_28/components/custom_textfield.dart';
import 'package:pas_mobile_11pplg2_28/controllers/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginAPIController controller = Get.find<LoginAPIController>();

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              label: "Username",
              controller: controller.usernameController,
            ),

            CustomTextField(
              label: "Password",
              controller: controller.passwordController,
              isPassword: true,
            ),

            const SizedBox(height: 24),

            Obx(() {
              return controller.isApiLoading.value
                  ? const CircularProgressIndicator()
                  : SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(
                        myText: "Login dengan API",
                        myTextColor: Colors.black,
                        onPressed: controller.login,
                      ),
                    );
            }),
          ],
        ),
      ),
    );
  }
}
