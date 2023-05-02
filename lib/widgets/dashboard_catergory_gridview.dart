import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu_ecommerce_demo/theme.dart';
import 'package:flutter/material.dart';

class CategoryGridView extends StatelessWidget {
  final CollectionReference _categories =
      FirebaseFirestore.instance.collection("categories");

  CategoryGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _categories.snapshots(),
      builder: (context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Text("Error");
        }

        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return CircularProgressIndicator();
          default:
            return Expanded(
              child: GridView(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                children: snapshot.data!.docs
                    .map<Widget>((DocumentSnapshot snapshot) {
                  return Stack(
                    children: [
                      FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: const AssetImage("assets/images/splash.png"),
                          image: NetworkImage(snapshot["image"])),
                      Positioned(
                          child: Container(
                        color: Colors.black.withOpacity(0.4),
                        child: Center(
                            child: Text(
                          snapshot["name"],
                          style: TextStyle(color: text_light_color),
                        )),
                      ))
                    ],
                  );
                }).toList(),
              ),
            );
        }
      },
    );
  }
}
