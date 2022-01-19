import 'package:ecommer_app/model/cart.dart';
import 'package:ecommer_app/page/cart_page.dart';
import 'package:ecommer_app/widget/badge.dart';
import 'package:ecommer_app/widget/product_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainHome extends StatelessWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("Order Coffee"),
          centerTitle: true,
          actions: <Widget>[
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                  value: cart.itemCount.toString(),
                  child: IconButton(
                      icon: const Icon(Icons.shopping_bag_outlined),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CartPage()));
                      })),
            )
          ]),
      body: Container(
          padding: const EdgeInsets.all(10.0), child: const ProductList()),
    );
  }
}
