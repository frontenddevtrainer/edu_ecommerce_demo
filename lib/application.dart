import 'package:edu_ecommerce_demo/screens/cart_screen.dart';
import 'package:edu_ecommerce_demo/screens/home_dashboard.dart';
import 'package:edu_ecommerce_demo/screens/login_screen.dart';
import 'package:edu_ecommerce_demo/screens/products_listing.dart';
import 'package:edu_ecommerce_demo/screens/register_screen.dart';
import 'package:edu_ecommerce_demo/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Application extends StatelessWidget {
  Application({super.key});

  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      home: FutureBuilder(
        future: _auth.authStateChanges().first,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return HomeDashboardScreen();
          } else {
            return const LoginScreen();
          }
        },
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/login":
            return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return const LoginScreen();
              },
            );

          case "/dashboard":
            return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return HomeDashboardScreen();
              },
            );

          case "/register":
            return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return const RegisterScreen();
              },
            );

          case "/products-listing":
            return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return const ProductListingScreen();
              },
            );

          case "/cart":
            return MaterialPageRoute(
              settings: settings,
              builder: (context) {
                return const CartScreen();
              },
            );
        }
      },
    );
  }
}
