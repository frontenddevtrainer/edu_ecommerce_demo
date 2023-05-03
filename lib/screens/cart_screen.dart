import 'package:edu_ecommerce_demo/widgets/application_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: ApplicationAppBar(title: "Cart"),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("cart")
            .doc(user!.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error occured");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final cartItems = snapshot.data!.data() as Map<String, dynamic>;

          if (cartItems == null || cartItems.isEmpty) {
            return Text("No item in cart.");
          }

          final products = cartItems['products'] ?? [];

          return ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];

                return ListTile(
                  title: Text(product['name']),
                );
              });
        },
      ),
    );
  }
}
