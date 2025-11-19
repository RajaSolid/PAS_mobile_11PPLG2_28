import 'package:get/get.dart';
import 'package:pas_mobile_11pplg2_28/bindings/home_binding.dart';
import 'package:pas_mobile_11pplg2_28/bindings/login_binding.dart';
import 'package:pas_mobile_11pplg2_28/bindings/register_binding.dart';
import 'package:pas_mobile_11pplg2_28/bindings/show_binding.dart';
import 'package:pas_mobile_11pplg2_28/bindings/splash_binding.dart';
import 'package:pas_mobile_11pplg2_28/pages/home_page.dart';
import 'package:pas_mobile_11pplg2_28/pages/login_page.dart';
import 'package:pas_mobile_11pplg2_28/pages/register_page.dart';
import 'package:pas_mobile_11pplg2_28/pages/splashscreen_page.dart';
import 'package:pas_mobile_11pplg2_28/pages/tvshow_page.dart';
import 'package:pas_mobile_11pplg2_28/routes/routes.dart';

class AppPages {
  static final pages = [
  GetPage(
    name: AppRoutes.home,
    page: ()=> HomePage(),
    binding: HomeBinding(),
  ),
  GetPage(
    name: AppRoutes.login,
    page: ()=> LoginPage(),
    binding: Loginapibinding(),
  ),
  GetPage(
    name: AppRoutes.splash,
    page: ()=> SplashscreenPage(),
    binding: Splashbinding(),
  ),
  GetPage(
    name: AppRoutes.tvshow,
    page: ()=> TvshowPage(),
    binding: ShowBinding(),
  ),
  GetPage(
    name: AppRoutes.register,
    page: ()=> RegisterPage(),
    binding: RegisterBinding(),
  ),

  ];
}