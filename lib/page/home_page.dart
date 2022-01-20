import 'package:ecommer_app/bloc/shopping_cart_bloc.dart';
import 'package:ecommer_app/model/cart.dart';
import 'package:ecommer_app/page/cart_page.dart';
import 'package:ecommer_app/widget/badge.dart';
import 'package:ecommer_app/widget/product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          actions: <Widget>[_builderCartAction(context)]),
      body: const ProductList(),
    );
  }

  Widget _builderCartAction(BuildContext ctx) {
    return BlocBuilder<ShoppingCartBloc, List<Cart>>(
      builder: (context, state) {
        return Badge(
          iconButton: IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const CartPage(),
              ));
            },
          ),
          value: state.length,
        );
      },
    );
  }
}
