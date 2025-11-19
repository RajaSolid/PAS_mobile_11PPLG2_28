import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/controllers/bottomnav_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final Bottomnavcontroller bottomnavcontroller = Get.find<Bottomnavcontroller>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        body: bottomnavcontroller.pages[bottomnavcontroller.curindex.value],
        bottomNavigationBar: BottomNavigationBar(
          onTap: bottomnavcontroller.changepage,
          currentIndex: bottomnavcontroller.curindex.value,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_2_outlined),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
