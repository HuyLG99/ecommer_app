import 'package:ecommer_app/cubit/cart_cubit.dart';
import 'package:ecommer_app/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemWidget extends StatelessWidget {
  final Cart cart;
  const CartItemWidget(this.cart, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 4,
        margin: const EdgeInsets.only(top: 6, left: 6, right: 6),
        child: ListTile(
          leading: Image.network(cart.drink.imageUrl),
          title: Text(cart.drink.title),
          subtitle: Text('${cart.drink.price * cart.quantity} vnd'),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context, listen: false)
                        .removeItem(cart.drink.id);
                    //Listen event RemoveFromCartEvent
                  },
                  icon: const Icon(Icons.remove_rounded)),
              Text('${cart.quantity}'),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<CartCubit>(context, listen: false)
                        .addItem(cart.drink.id);
                    //Listen event AddToCartEvent
                  },
                  icon: const Icon(Icons.add_rounded)),
            ],
          ),
        ));
  }
}
