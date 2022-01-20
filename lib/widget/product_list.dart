import 'package:ecommer_app/model/dinkinfo.dart';
import 'package:ecommer_app/widget/product_item.dart';
import 'package:flutter/material.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final drinks = Drinks.drinks;
    return GridView.builder(
        itemCount: drinks.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (contex, index) => ProductCard(
              drinks[index],
            ));
  }
}
