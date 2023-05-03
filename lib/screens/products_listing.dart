import 'package:edu_ecommerce_demo/widgets/application_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductListingScreen extends StatelessWidget {
  const ProductListingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;

    return Scaffold(
      appBar: ApplicationAppBar(
        title: arguments['name'],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection("products")
            .where("category", isEqualTo: arguments['category'])
            .snapshots(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {}

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data!.docs.isEmpty) {
            return const Text("No products found");
          }

          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context, index) {
                DocumentSnapshot product = snapshot.data!.docs[index];

                return ListTile(
                  title: Text(product['name']),
                  leading: Image.network(product["thumbnail"]),
                  trailing: ElevatedButton(
                    child: Text("Add to cart"),
                    onPressed: () {},
                  ),
                );
              });
        },
      ),
    );
  }
}
