import 'package:ecommer_app/bloc/shopping_cart_bloc.dart';
import 'package:ecommer_app/model/cart.dart';
import 'package:ecommer_app/page/home_page.dart';
import 'package:ecommer_app/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<ShoppingCartBloc>(context);

    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainHome()));
            },
          ),
          title: const Padding(
            padding: EdgeInsets.only(left: 110.0),
            child: Text("Cart"),
          ),
        ),
        body: BlocBuilder<ShoppingCartBloc, List<Cart>>(
          builder: (context, state) => ListView.builder(
            itemBuilder: (context, index) {
              return CartItemWidget(cartBloc.state[index]);
            },
            padding: const EdgeInsets.only(bottom: 100),
            itemCount: cartBloc.state.length,
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => cartBloc.add(const CheckOutEvent()),
          label: BlocBuilder<ShoppingCartBloc, List<Cart>>(
            builder: (context, state) => Text('${cartBloc.getTotalAmount()}'),
          ),
          icon: const Icon(Icons.monetization_on_sharp),
        ));
  }
}
