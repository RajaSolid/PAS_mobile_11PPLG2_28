import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/components/custom_button.dart';
import 'package:pas_mobile_11pplg2_28/controllers/logout_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profilepage extends StatefulWidget {
  const Profilepage({super.key});

  @override
  State<Profilepage> createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  final LogoutController logoutController = Get.put(LogoutController());

  String username = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username') ?? 'Tidak diketahui';
      email = prefs.getString('email') ?? '-';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Profil")),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage("assets/profil.jpeg"),
                ),
                const SizedBox(height: 10),

                // Nama dan Email
                Text(
                  username,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(email, style: TextStyle(color: Colors.grey[700])),
                const SizedBox(height: 20),

                const Text(
                  "Hallo!",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),

                const ListTile(
                  leading: Icon(Icons.phone),
                  title: Text("0819-1711-2146"),
                ),
                const ListTile(
                  leading: Icon(Icons.school),
                  title: Text("Pelajar SMK"),
                ),
                const SizedBox(height: 20),

                      CustomButton(
                        myText: 'Logout',
                        myTextColor: Colors.red,
                        onPressed: logoutController.logout,
                      ),
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
