import 'package:eshop/models/Product.dart';
import 'package:eshop/screen/cart_screen.dart';
import 'package:flutter/material.dart';

import 'data.dart';

class Item1 extends StatefulWidget {
  @override
  _ItemState createState() => _ItemState();
}

class _ItemState extends State<Item1> {
  get cart => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 1.9,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 15, 81, 187),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(50),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Center(
                            child: Stack(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 75,
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 75,
                                    backgroundColor:
                                        Color(0xffbccaca).withOpacity(0.5),
                                  ),
                                ),
                                Image.network(
                                  products[1]['image'],
                                  height: 200,
                                )
                              ],
                            ),
                          ),
                        ),
                        flex: 6,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 152, 152, 152),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    products[1]['name'],
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 23),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Row(children: [
                      CircleAvatar(
                        backgroundColor: Colors.black54,
                        radius: 5,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        products[1]['description'],
                        style: TextStyle(color: Colors.black54, fontSize: 16),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Row(
              children: [
                Expanded(
                  child: Text(
                    '\$${products[1]['price']}',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    child:
                        //creer un bouton pour ajouter au panier avec une methode onpressed qui ajoute au panier
                        ButtonBar(
                      children: [
                        IconButton(
                          //create product
                          onPressed: () {
                            Product product = Product(
                              name: products[1]['name'],
                              price: products[1]['price'],
                              image: products[1]['image'],
                              color: products[1]['color'],
                              description: products[1]['description'],
                              store: products[1]['store'],
                            );

                            cart.add(product);
                          },
                          icon: Icon(
                            Icons.add_shopping_cart,
                            color: Color.fromARGB(255, 2, 59, 88),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
