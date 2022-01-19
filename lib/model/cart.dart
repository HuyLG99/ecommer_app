import 'package:ecommer_app/model/drink.dart';
import 'package:flutter/material.dart';

class Cart with ChangeNotifier {
  Map<String, Drink> _items = {};
  Map<String, Drink> get items {
    return {..._items};
  }

  int get itemCount {
    return _items.length;
  }

  double get totalAmount {
    var total = 0.0;
    _items.forEach((key, drink) {
      total += drink.price * drink.quantity;
    });
    return total;
  }

  void addItem(String id, String title, double price, String imgUrl) {
    _items.putIfAbsent(
        id,
        () => Drink(
            id: id, title: title, quantity: 1, price: price, imageUrl: imgUrl));
    notifyListeners();
  }

  void addAmount(String id) {
    _items.update(
        id,
        (existingCartItem) => Drink(
            id: existingCartItem.id,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity + 1,
            price: existingCartItem.price,
            imageUrl: existingCartItem.imageUrl));
    notifyListeners();
  }

  void less(String id) {
    _items.update(
        id,
        (existingCartItem) => Drink(
            id: existingCartItem.id,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity - 1,
            price: existingCartItem.price,
            imageUrl: existingCartItem.imageUrl));
    notifyListeners();
  }

  void removeItem(String drinkId) {
    _items.remove(drinkId);
    notifyListeners();
  }

  void clear() {
    _items = {};
    notifyListeners();
  }

  void toggleAddToCardStatus(String drinkId) {
    _items.update(
        drinkId,
        (existingCartItem) => Drink(
            id: existingCartItem.id,
            title: existingCartItem.title,
            quantity: existingCartItem.quantity,
            price: existingCartItem.price,
            imageUrl: existingCartItem.imageUrl));
    notifyListeners();
  }
}
