import 'package:bloc/bloc.dart';
import 'package:ecommer_app/model/cart.dart';
import 'package:ecommer_app/model/dinkinfo.dart';
import 'package:ecommer_app/model/drink.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState([]));

  final List<Drink> _drindata = Drinks.drinks;
  List<Cart> cartItems = [];

  void addItem(String drinkId) {
    final item = _drindata.firstWhere((drink) => drink.id == drinkId);
    if (cartItems.any((cart) => cart.drink.id == drinkId)) {
      cartItems.firstWhere((cart) => cart.drink.id == drinkId).quantity += 1;
    } else {
      cartItems.add(Cart(
        drink: item,
        id: DateTime.now().toString(),
        quantity: 1,
      ));
    }
    emit(CartState(cartItems));
  }

  void removeItem(String drinkId) {
    final cartItem = cartItems.firstWhere((cart) => cart.drink.id == drinkId);
    if (cartItem.quantity > 1) {
      cartItems[cartItems.indexOf(cartItem)].quantity -= 1;
    } else {
      cartItems.removeWhere((cart) => cart.drink.id == drinkId);
    }
    emit(CartState(cartItems));
  }

  bool isAdded(String drinkId) {
    return cartItems.any((cart) => cart.drink.id == drinkId);
  }

  void checkOut() {
    cartItems.clear();
    emit(CartState(cartItems));
  }

  int getTotalAmount() {
    var total = 0;
    for (var cart in cartItems) {
      total += cart.drink.price * cart.quantity;
    }
    return total;
  }
}
