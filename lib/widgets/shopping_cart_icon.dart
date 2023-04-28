import 'package:edu_ecommerce_demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ShoppingCartIcon extends StatelessWidget {
  final int count;

  ShoppingCartIcon({super.key, this.count = 0});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart)),
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
