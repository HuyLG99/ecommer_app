import 'package:ecommer_app/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/cart.dart';
import 'model/dinkinfo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Drinks()),
        ChangeNotifierProvider.value(value: Cart()),
      ],
      child: const MaterialApp(
        title: "Order Coffee",
        home: MainHome(),
      ),
    );
  }
}
