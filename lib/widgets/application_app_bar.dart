import 'package:edu_ecommerce_demo/widgets/shopping_cart_icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ApplicationAppBar extends StatelessWidget with PreferredSizeWidget {

  final String title;
  final _userCredential = FirebaseAuth.instance;

  ApplicationAppBar({
    super.key,
    this.title = ""
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      actions: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
        ShoppingCartIcon(
          count: 10,
        ),
        IconButton(
            onPressed: () {
              _userCredential.signOut();
              Navigator.pushNamedAndRemoveUntil(
                  context, "/login", (route) => false);
            },
            icon: const Icon(Icons.logout)),
      ],
    );
  }
  
  @override
  Size get preferredSize => AppBar().preferredSize;
}
