import 'package:ecommer_app/cubit/cart_cubit.dart';
import 'package:ecommer_app/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: const MaterialApp(
        title: "Order Coffee",
        home: MainHome(),
      ),
    );
  }
}
