import 'package:bloc/bloc.dart';
import 'package:ecommer_app/model/cart.dart';
import 'package:ecommer_app/model/dinkinfo.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'shopping_cart_event.dart';

class ShoppingCartBloc extends Bloc<ShoppingCartEvent, List<Cart>> {
  final _drinkData = Drinks.drinks;

  ShoppingCartBloc() : super(<Cart>[]) {
    on<AddToCartEvent>(_onAddItemToCart);
    on<RemoveFromCartEvent>(_onRemoveItemFromCart);
    on<CheckOutEvent>(_onCheckOutEvent);
  }

  void _onAddItemToCart(AddToCartEvent event, Emitter<List<Cart>> emit) {
    List<Cart> newState = List.from(state);
    final item = _drinkData.firstWhere((drink) => drink.id == event.drinkId);
    //find item with this id
    //firstWhere is return fist item
    if (newState.any((cart) => cart.drink.id == event.drinkId)) {
      newState.firstWhere((cart) => cart.drink.id == event.drinkId).quantity +=
          1;
    } else {
      newState.add(
        Cart(
          id: DateTime.now().toString(),
          drink: item,
          quantity: 1,
        ),
      );
    }
    emit(newState);
  }

  void _onRemoveItemFromCart(
      RemoveFromCartEvent event, Emitter<List<Cart>> emit) {
    List<Cart> newState = List.from(state);
    final cartItem =
        newState.firstWhere((cart) => cart.drink.id == event.drinkId);
    if (cartItem.quantity > 1) {
      newState[newState.indexOf(cartItem)].quantity -= 1;
    } else {
      newState.removeWhere((cart) => cart.drink.id == event.drinkId);
    }
    emit(newState);
  }

  void _onCheckOutEvent(CheckOutEvent event, Emitter<List<Cart>> emit) {
    emit([]);
  }

  bool isAdded(String drinkId) {
    return state.any((cart) => cart.drink.id == drinkId);
  }

  int getTotalAmount() {
    var total = 0;
    for (var cart in state) {
      total += cart.drink.price * cart.quantity;
    }
    return total;
  }
}
