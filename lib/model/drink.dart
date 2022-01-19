import 'package:flutter/material.dart';

class Drink with ChangeNotifier {
  final String id;
  final String title;
  final double price;
  final String imageUrl;
  bool isChoose;
  int quantity;

  Drink(
      {required this.id,
      required this.title,
      required this.price,
      required this.imageUrl,
      this.isChoose = false,
      this.quantity = 0});

  void toggleAddToCardStatus() {
    isChoose = true;
    notifyListeners();
  }

  void toggleRemoveItem() {
    isChoose = false;
    notifyListeners();
  }
}
