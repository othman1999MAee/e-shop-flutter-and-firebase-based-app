import 'package:eshop/models/product.dart';
import 'package:eshop/screen/Item3.dart';
import 'package:eshop/screen/item.dart';
import 'package:flutter/material.dart';

import 'Item1.dart';
import 'Item2.dart';

class Search extends StatefulWidget {
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchTextController = TextEditingController();
  List<Product> allProducts = [];
  List<Product> filteredProducts = [];

  @override
  void initState() {
    super.initState();
    allProducts = [
      Product(
        name: "Nike Air Max 270",
        price: "150",
        image: "assets/images/nike_air_270.png",
        color: 0xFF3D82AE,
        description: "The Nike Air Max 270 delivers visible cushioning under",
        store: "Nike",
      ),
      Product(
        name: "Nike Air Max 90",
        price: "120",
        image: "assets/images/nike_air_270.png",
        color: 0xFF3D82AE,
        description: "NThe Nike Air Max 90 stays true to its OG running roots.",
        store: "Nike",
      ),
      Product(
        name: "Nike Air Max 95",
        price: "170",
        image: "assets/images/nike_air_270.png",
        color: 0xFF3D82AE,
        description: "include visible Nike Air cushioning in the forefoot",
        store: "Nike",
      ),
      Product(
        name: "Nike Air Max 97",
        price: "170",
        image: "assets/images/nike_air_270.png",
        color: 0xFF3D82AE,
        description:
            "include visible Nike Air cushioning in the forefoot strong",
        store: "Nike",
      ),
    ];
    filteredProducts = allProducts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          controller: _searchTextController,
          decoration: InputDecoration(
            hintText: "Search",
            hintStyle: TextStyle(color: Colors.black),
            border: InputBorder.none,
          ),
          style: TextStyle(color: Colors.black),
          onChanged: (text) {
            text = text.toLowerCase();
            setState(() {
              filteredProducts = allProducts.where((element) {
                var elementName = element.name.toLowerCase();
                var elementPrice = element.price.toLowerCase();
                var elementDescription = element.description.toLowerCase();
                return elementName.contains(text) ||
                    elementPrice.contains(text) ||
                    elementDescription.contains(text);
              }).toList();
            });
          },
        ),
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              String productName = filteredProducts[index].name;
              if (productName.contains("270")) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Item()),
                );
              } else if (productName.contains("90")) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Item1()),
                );
              } else if (productName.contains("95")) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Item2()),
                );
              } else if (productName.contains("97")) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Item3()),
                );
              }
            },
            child: ListTile(
              title: Text(filteredProducts[index].name),
            ),
          );
        },
      ),
    );
  }
}
