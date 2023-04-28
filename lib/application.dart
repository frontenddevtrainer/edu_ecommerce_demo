import 'package:edu_ecommerce_demo/screens/home_dashboard.dart';
import 'package:edu_ecommerce_demo/screens/login_screen.dart';
import 'package:edu_ecommerce_demo/screens/register_screen.dart';
import 'package:edu_ecommerce_demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Edu Ecommerce App",
      theme: ThemeData(
          fontFamily: "Montserrat",
          appBarTheme: AppBarTheme(
              backgroundColor: brand_color,
              centerTitle: false,
              elevation: 0,
              titleTextStyle: const TextStyle(
                  fontFamily: "MontserratMedium",
                  fontSize: 24,
                  fontWeight: FontWeight.bold))),
      initialRoute: "/home_dashbaoard",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen(),
        "/home_dashbaoard": (context) => HomeDashboardScreen()
      },
    );
  }
}
