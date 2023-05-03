import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final product;
  final id;
  const ProductItem({super.key, this.product, this.id});

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  int quantity = 0;

  void _increaseQuantity() {
    setState(() {
      quantity++;
    });
    _updateQuantity();
  }

  void _decreaseQuantity() {
    setState(() {
      if (quantity > 0) {
        quantity--;
      }
    });
    _updateQuantity();
  }

  void _getQuantity() async {
    DocumentSnapshot cart = await FirebaseFirestore.instance
        .collection("cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (cart.exists) {
      final Map<String, dynamic> cartData = cart.data() as Map<String, dynamic>;
      final products = cartData["products"] ?? [];

      for (var i = 0; i < products.length; i++) {
        if (products[i]["id"] == widget.id) {
          setState(() {
            quantity = products[i]["quantity"];
          });
        }
      }
    }
  }

  void _updateQuantity() async {
    DocumentSnapshot cart = await FirebaseFirestore.instance
        .collection("cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    if (cart.exists) {
      final Map<String, dynamic> cartData = cart.data() as Map<String, dynamic>;
      final products = cartData["products"] ?? [];

      for (var i = 0; i < products.length; i++) {
        if (products[i]["id"] == widget.id) {
          products[i]["quantity"] = quantity;
        }
      }

      FirebaseFirestore.instance
          .collection("cart")
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({"products": products});
    }
  }

  @override
  initState() {
    super.initState();
    _getQuantity();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.product['name']),
      leading: Image.network(widget.product["thumbnail"]),
      trailing: quantity == 0
          ? ElevatedButton(
              onPressed: () {
                FirebaseFirestore.instance
                    .collection("cart")
                    .doc(FirebaseAuth.instance.currentUser!.uid)
                    .set({
                  "products": FieldValue.arrayUnion([
                    {
                      'name': widget.product['name'],
                      'price': widget.product['price'],
                      "id": widget.id,
                      "quantity": 1
                    }
                  ])
                }, SetOptions(merge: true));
                setState(() {
                  quantity = 1;
                });
              },
              child: Text("Add to cart"))
          : Row(mainAxisSize: MainAxisSize.min, children: [
              IconButton(
                  onPressed: _decreaseQuantity, icon: Icon(Icons.remove)),
              Text(quantity.toString()),
              IconButton(onPressed: _increaseQuantity, icon: Icon(Icons.add)),
            ]),
    );
  }
}
