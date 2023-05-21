import 'package:eshop/models/product.dart';
import 'package:flutter/material.dart';

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
        description:
            "The Nike Air Max 270 delivers visible cushioning under every step with updated Nike Air technology. With its dual-density midsole, it flexes with your foot for comfort that lasts all day—during your run or your day-to-day hustle.",
        store: "Nike",
      ),
      Product(
        name: "Nike Air Max 90",
        price: "800",
        image: "assets/images/nike_air_270.png",
        color: 0xFF3D82AE,
        description: "The Nike Air Max ",
        store: "Nike",
      ),
      Product(
        name: "Nike Air Max 95",
        price: "600",
        image: "assets/images/nike_air_270.png",
        color: 0xFF3D82AE,
        description: "The Nike Air Max ",
        store: "Nike",
      ),
      Product(
        name: "Nike Air Max 97",
        price: "500",
        image: "assets/images/nike_air_270.png",
        color: 0xFF3D82AE,
        description: "The Nike Air Max ",
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
                var elementTitle = element.name.toLowerCase();
                return elementTitle.contains(text);
              }).toList();
            });
          },
        ),
      ),
      body: ListView.builder(
        itemCount: filteredProducts.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(filteredProducts[index].name),
          );
        },
      ),
    );
  }
}
