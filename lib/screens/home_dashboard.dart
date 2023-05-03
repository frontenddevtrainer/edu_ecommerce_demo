import 'package:edu_ecommerce_demo/widgets/application_app_bar.dart';
import 'package:edu_ecommerce_demo/widgets/dashboard_cards_list.dart';
import 'package:edu_ecommerce_demo/widgets/dashboard_catergory_gridview.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
        appBar: ApplicationAppBar(title: "Groceries",),
        body: Column(
          children: [DashboardCardsList(), CategoryGridView()],
        ));
  }
}


