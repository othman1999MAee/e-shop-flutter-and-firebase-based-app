//empty page with a button to go to the home page

import 'dart:html';

import 'package:eshop/models/Product.dart';
import 'package:flutter/material.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);
  //global list of products
  static const List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //create a product list view from the list of products
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index].name),
            subtitle: Text(products[index].price.toString()),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.home),
      ),
    );
  }

  //create a method add to cart
  List<Product> add_to_cart(Product product) {
    products.add(product);
    // Test if the product is added to the list
    print(products.length);
    return products.toList();
  }
}
