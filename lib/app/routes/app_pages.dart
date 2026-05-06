
import 'package:flutter/material.dart';
import 'package:projeto02/app/routes/app_routes.dart';
import 'package:projeto02/features/auth/view/home_page.dart';
import 'package:projeto02/features/auth/view/login_page.dart';
import 'package:projeto02/features/auth/view/pedidos_page.dart';
import 'package:projeto02/features/auth/view/register_page.dart';
import 'package:projeto02/features/auth/view/splash_page.dart';

abstract class AppPages {
  static Map<String, WidgetBuilder> get routes => {
    AppRoutes.splash: (_) => const SplashPage(),
    AppRoutes.login: (_) => const LoginPage(),
    AppRoutes.register: (_) => const RegisterPage(),
    AppRoutes.home: (_) => const HomePage(),
    AppRoutes.pedidos: (_) => const PedidosPage(),
  };
}