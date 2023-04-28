import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/shopping_cart_icon.dart';

class HomeDashboardScreen extends StatelessWidget {
  const HomeDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Groceries"),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
          ShoppingCartIcon(count: 10,)
        ],
      ),
    );
  }
}
