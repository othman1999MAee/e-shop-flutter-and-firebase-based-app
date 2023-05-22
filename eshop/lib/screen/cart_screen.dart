// cart_screen.dart
import 'package:eshop/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:eshop/models/Product.dart';

class Cart extends StatefulWidget {
  static final List<Product> products = [];

  static void addToCart(Product product) {
    products.add(product);
  }

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  void removeFromCart(int index) {
    setState(() {
      Cart.products.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: Cart.products.length,
        itemBuilder: (context, index) {
          final product = Cart.products[index];
          return ListTile(
            title: Text(product.name),
            subtitle: Text('\$${product.price}'),
            trailing: IconButton(
              icon: Icon(Icons.remove_circle),
              color: Colors.red,
              onPressed: () {
                removeFromCart(index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Home()),
          );
        },
        child: Icon(Icons.home),
      ),
    );
  }
}
