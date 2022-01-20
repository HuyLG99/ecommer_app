part of 'shopping_cart_bloc.dart';

@immutable
abstract class ShoppingCartEvent extends Equatable {
  const ShoppingCartEvent();
  @override
  List<Object> get props => [];
}

//Use id to add to cart
class AddToCartEvent extends ShoppingCartEvent {
  final String drinkId;
  const AddToCartEvent(this.drinkId);
}

//Use id to remove to cart
class RemoveFromCartEvent extends ShoppingCartEvent {
  final String drinkId;
  const RemoveFromCartEvent(this.drinkId);
}

class CheckOutEvent extends ShoppingCartEvent {
  const CheckOutEvent();
}
