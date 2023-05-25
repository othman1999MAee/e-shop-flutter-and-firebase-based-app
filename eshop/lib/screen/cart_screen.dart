import 'package:eshop/screen/home_screen.dart';
import 'package:eshop/screen/payment_screen.dart';
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

  double calculateTotalAmount() {
    double total = 0;
    for (var product in Cart.products) {
      total += double.parse(product.price);
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    double totalAmount = calculateTotalAmount();

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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      PaymentScreen(totalAmount: totalAmount)),
            );
          },
          child: Text('Proceed to Payment'),
        ),
      ),
    );
  }
}
