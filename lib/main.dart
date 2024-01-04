import 'package:bloc_shopper/screens/cart_screen.dart';
import 'package:bloc_shopper/screens/login_screen.dart';
import 'package:bloc_shopper/screens/shopping_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'cubits/cart_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const LoginScreen(),
        routes: {
          '/shopping': (context) => const ShoppingScreen(),
          '/cart': (context) => const CartScreen(),
        },
      ),
    );
  }
}
