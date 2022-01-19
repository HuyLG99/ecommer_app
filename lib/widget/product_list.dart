import 'package:ecommer_app/model/dinkinfo.dart';
import 'package:ecommer_app/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drinksData = Provider.of<Drinks>(context);
    final drinks = drinksData.drinks;
    return GridView.builder(
      itemCount: drinks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 2.0, mainAxisSpacing: 2.0),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: drinks[index],
        child: const ProductCard(),
      ),
    );
  }
}
