import 'package:ecommer_app/cubit/cart_cubit.dart';
import 'package:ecommer_app/model/cart.dart';
import 'package:ecommer_app/model/drink.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCard extends StatelessWidget {
  final Drink drink;
  const ProductCard(
    this.drink, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartCubit>(context, listen: false);
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: GridTile(
          child: Image.network(
            drink.imageUrl,
            fit: BoxFit.cover,
          ),
          footer: _buildFooter(drink, context, cartBloc),
        ),
      ),
    );
  }

  Widget _buildFooter(Drink drink, BuildContext context, CartCubit cartCubit) {
    return GridTileBar(
        backgroundColor: Colors.black38,
        title: Text(drink.title),
        subtitle: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            '${drink.price} vnd',
            style: const TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ),
        trailing: BlocBuilder<CartCubit, CartState>(builder: (context, state) {
          return cartCubit.isAdded(drink.id)
              ? IconButton(
                  onPressed: () => cartCubit.removeItem(drink.id),
                  icon: const Icon(Icons.check_rounded),
                )
              : IconButton(
                  onPressed: () => cartCubit.addItem(drink.id),
                  icon: const Icon(Icons.add_rounded),
                );
        }));
  }
}
