import 'package:edu_ecommerce_demo/theme.dart';
import 'package:flutter/material.dart';
import "package:firebase_auth/firebase_auth.dart";

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
  String _asyncFormErrorMessage = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _register() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: _emailController.text,
                password: _passwordController.text);

        Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          setState(() {
            _asyncFormErrorMessage =
                "Provided password doesn't meet the requirements please correct";
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: brand_color,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
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
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Please provide your Email";
                    }

                    bool emailFormatValidation =
                        RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value);

                    if (!emailFormatValidation) {
                      return "Please provide valid email";
                    }

                    return null;
                  },
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
                  onPressed: _register,
                  text: "Create",
                ),
                _asyncFormErrorMessage.isNotEmpty
                    ? Padding(
                        padding: const EdgeInsets.only(top: 50),
                        child: Text(
                          _asyncFormErrorMessage,
                          style: TextStyle(color: Colors.red),
                        ),
                      )
                    : const Text(""),
                const SizedBox(height: 50),
                Text("Have an account ? Sign in",
                    style: TextStyle(color: text_light_color, fontSize: 16))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
