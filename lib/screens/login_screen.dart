import 'package:edu_ecommerce_demo/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/elevated_button.dart';
import '../widgets/textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _login() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _usernameController.text,
              password: _passwordController.text);

      Navigator.pushNamedAndRemoveUntil(
          context, "/dashboard", (route) => false);
    } on FirebaseAuthException catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brand_color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to tradly",
                  style: TextStyle(
                      color: text_light_color,
                      fontFamily: "MontserratMedium",
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 50,
                ),
                Text(
                  "Login to your account",
                  style: TextStyle(color: text_light_color, fontSize: 16),
                ),
                const SizedBox(
                  height: 50,
                ),
                EduTextField(
                  hintText: "Email/Mobile Number",
                  controller: _usernameController,
                ),
                const SizedBox(
                  height: 25,
                ),
                EduTextField(
                  hintText: "Password",
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 50),
                EduElevatedButton(
                  onPressed: _login,
                  text: "Login",
                ),
                const SizedBox(height: 50),
                Text(
                  "Forgot your password?",
                  style: TextStyle(color: text_light_color, fontSize: 16),
                ),
                const SizedBox(height: 50),
                Text("Don’t have an account? Sign up",
                    style: TextStyle(color: text_light_color, fontSize: 16))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
