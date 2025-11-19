import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/fragments/favorite_fragment.dart';
import 'package:pas_mobile_11pplg2_28/fragments/home_fragment.dart';
import 'package:pas_mobile_11pplg2_28/fragments/profile_fragment.dart';
import 'package:pas_mobile_11pplg2_28/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bottomnavcontroller extends GetxController {
  var curindex = 0.obs;

  final List<Widget> pages = [
    HomeFragment(),
    FavoriteFragment(),
    ProfileFragment(),
  ];

  void changepage(int index) {
    curindex.value = index;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    Get.offAllNamed(AppRoutes.login);
  }
}
