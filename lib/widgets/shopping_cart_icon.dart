import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_ecommerce_demo/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShoppingCartIcon extends StatefulWidget {
  const ShoppingCartIcon({super.key});

  @override
  State<ShoppingCartIcon> createState() => _ShoppingCartIconState();
}

class _ShoppingCartIconState extends State<ShoppingCartIcon> {
  num count = 0;

  void _getQuantity() async {
    DocumentSnapshot cart = await FirebaseFirestore.instance
        .collection("cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (cart.exists) {
      final Map<String, dynamic> cartData = cart.data() as Map<String, dynamic>;
      final products = cartData["products"] ?? [];
      num itemCount = 0;
      for (var i = 0; i < products.length; i++) {
        itemCount = itemCount + products[i]['quantity'];
      }
      setState(() {
        count = itemCount;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getQuantity();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "/cart");
              },
              icon: const Icon(Icons.shopping_cart)),
        ),
        Positioned(
            top: 5,
            right: 5,
            child: Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Colors.red, borderRadius: BorderRadius.circular(9)),
              constraints: const BoxConstraints(minHeight: 18, minWidth: 18),
              child: Text(
                count.toString(),
                style: TextStyle(color: text_light_color, fontSize: 10),
                textAlign: TextAlign.center,
              ),
            ))
      ],
    );
  }
}
