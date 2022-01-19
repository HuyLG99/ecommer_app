import 'package:ecommer_app/model/cart.dart';
import 'package:ecommer_app/model/dinkinfo.dart';
import 'package:ecommer_app/model/drink.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    final cartItem = Provider.of<Drink>(context);
    final drinks = Provider.of<Drinks>(context);
    return SizedBox(
      height: 100,
      child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.network(cartItem.imageUrl),
            title: Text(cartItem.title),
            subtitle: Text('${cartItem.price * cartItem.quantity}'),
            trailing: SizedBox(
              width: 120,
              child: Row(
                children: <Widget>[
                  SizedBox(
                      child: IconButton(
                          onPressed: () {
                            if (cartItem.quantity == 1) {
                              cart.removeItem(cartItem.id);
                              drinks.removeItem(cartItem.id);
                            } else {
                              cart.less(cartItem.id);
                            }
                          },
                          icon: const Icon(Icons.horizontal_rule_outlined))),
                  Text('${cartItem.quantity}'),
                  SizedBox(
                      child: IconButton(
                          onPressed: () {
                            cart.addAmount(cartItem.id);
                          },
                          icon: const Icon(Icons.add))),
                ],
              ),
            ),
          )),
    );
  }
}
