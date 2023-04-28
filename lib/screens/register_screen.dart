import 'package:edu_ecommerce_demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/elevated_button.dart';
import '../widgets/textfield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brand_color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
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
                "Signup to your account",
                style: TextStyle(color: text_light_color, fontSize: 16),
              ),
              const SizedBox(
                height: 50,
              ),
              EduTextField(
                hintText: "First Name",
                controller: _firstnameController,
              ),
              const SizedBox(
                height: 25,
              ),
              EduTextField(
                hintText: "Last Name",
                controller: _lastameController,
              ),
              const SizedBox(
                height: 25,
              ),
              EduTextField(
                hintText: "Email ID/Phone Number",
                controller: _emailController,
              ),
              const SizedBox(
                height: 25,
              ),
              EduTextField(
                hintText: "Password",
                controller: _passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 25,
              ),
              EduTextField(
                hintText: "Re-enter Password",
                controller: _repasswordController,
                obscureText: true,
              ),
              const SizedBox(height: 50),
              EduElevatedButton(
                onPressed: () {},
                text: "Create",
              ),
              const SizedBox(height: 50),
              Text("Have an account ? Sign in",
                  style: TextStyle(color: text_light_color, fontSize: 16))
            ],
          ),
        ),
      ),
    );
  }
}
