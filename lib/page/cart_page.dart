import 'package:ecommer_app/cubit/cart_cubit.dart';
import 'package:ecommer_app/page/home_page.dart';
import 'package:ecommer_app/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartCubit = Provider.of<CartCubit>(context);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainHome()));
          },
        ),
        title: const Center(child: Text("Cart")),
      ),
      body: ListView.builder(
        itemCount: cartCubit.cartItems.length,
        itemBuilder: (context, index) {
          return CartItemWidget(cartCubit.cartItems[index]);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => cartCubit.checkOut(),
        label: Text('${cartCubit.getTotalAmount()} vnd'),
        icon: const Icon(Icons.monetization_on),
      ),
    );
  }
}
