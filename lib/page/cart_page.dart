import 'package:ecommer_app/model/cart.dart';
import 'package:ecommer_app/model/dinkinfo.dart';
import 'package:ecommer_app/page/home_page.dart';
import 'package:ecommer_app/widget/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartsData = Provider.of<Cart>(context);
    final carts = cartsData.items;
    final drinks = Provider.of<Drinks>(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MainHome()));
            },
          ),
<<<<<<< Updated upstream
          title: const Center(child: Text("Cart")),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 430,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: carts.length,
                itemBuilder: (context, index) => ChangeNotifierProvider.value(
                    value: carts.values.toList()[index],
                    child: const CartItemWidget()),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Total:' +
                      ' '
                          '${cartsData.totalAmount} vnđ',
                  style: const TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // Provider.of<Orders>(context, listen: false)
                  //     .addOrder(carts.values.toList(), cartsData.totalAmount);
                  // carts.forEach((key, drink) {
                  //   drinks.removeItem(drink.id);
                  // });
                  // cartsData.clear();
                },
              ),
            )
          ],
=======
          title: const Padding(
            padding: EdgeInsets.only(left: 110.0),
            child: Text("Cart"),
          ),
        ),
        //Body listen Bloc have list cart
        //Mangage state change
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
          onPressed: () => cartBloc.add(
              const CheckOutEvent()), //checkout event from ShoppingCartBloc
          label: BlocBuilder<ShoppingCartBloc, List<Cart>>(
            //Bloc get total from cart in this cart
            builder: (context, state) => Text('${cartBloc.getTotalAmount()}'),
          ),
          icon: const Icon(Icons.monetization_on_sharp),
>>>>>>> Stashed changes
        ));
  }
}
