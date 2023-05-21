import 'package:eshop/models/Product.dart';

class Order {
  String email;
  String date;
  List<Product> products;

  Order({required this.email, required this.date, required this.products});
}
