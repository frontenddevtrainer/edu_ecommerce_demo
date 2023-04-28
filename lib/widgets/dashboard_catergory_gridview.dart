import 'package:edu_ecommerce_demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CategoryGridView extends StatelessWidget {
  final List<dynamic> categories;

  const CategoryGridView({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return Container(
            child: Stack(
              children: [
                Image.network(
                  "https://picsum.photos/seed/${index + 1}/300/300",
                  fit: BoxFit.cover,
                ),
                Positioned(
                    child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Center(
                      child: Text(
                    categories[index]["name"],
                    style: TextStyle(color: text_light_color),
                  )),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
