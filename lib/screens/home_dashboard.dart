import 'package:edu_ecommerce_demo/widgets/dashboard_cards_list.dart';
import 'package:edu_ecommerce_demo/widgets/dashboard_catergory_gridview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../widgets/shopping_cart_icon.dart';

class HomeDashboardScreen extends StatelessWidget {
  HomeDashboardScreen({super.key});

  final _categories = [
    {"name": "Beverages"},
    {"name": "Bread & Bakery"},
    {"name": "Vegetables"},
    {"name": "Pet Care"},
    {"name": "Fruit"},
    {"name": "Egg"},
    {"name": "Frozen veg"},
    {"name": "Homecare"}
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Groceries"),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.favorite)),
            ShoppingCartIcon(
              count: 10,
            )
          ],
        ),
        body: Column(
          children: [
            DashboardCardsList(),
            CategoryGridView(
              categories: _categories,
            )
          ],
        ));
  }
}
