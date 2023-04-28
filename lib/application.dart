import 'package:edu_ecommerce_demo/screens/login_screen.dart';
import 'package:edu_ecommerce_demo/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Edu Ecommerce App",
      theme: ThemeData(fontFamily: "Montserrat"),
      initialRoute: "/register",
      routes: {
        "/login": (context) => const LoginScreen(),
        "/register": (context) => const RegisterScreen()
      },
    );
  }
}
