import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CartState {}

class CartInitialState extends CartState {
  final List<String> cartItems = [];
  final int cost = 0;
}

class CartUpdatedState extends CartState {
  final List<String> cartItems;
  final int cost;

  CartUpdatedState(this.cartItems, this.cost);
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitialState());

  final List<String> shopItems = [
    'Code Smell',
    'Control Flow',
    'Interpreter',
    'Recursion',
    'Sprint',
    'Heisenburg',
    'Spaghetti',
    'Hydra Code',
    'Off-By-One',
    'Scope',
    'Callback',
    'Closure',
    'Automata',
    'Bit Shift',
    'Currying',
  ];
  final List<String> cartItems = [];
  final List<Color> rainbowColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue,
    Colors.indigo,
    Colors.purple,
  ];
  final int price = 42;
  var cost = 0;

  void addToCart(String item) {
    cartItems.add(item);
    cost += price;
    emit(CartUpdatedState(cartItems, cost));
  }

  void removeFromCart(String item) {
    cartItems.remove(item);
    cost -= price;
    emit(CartUpdatedState(cartItems, cost));
  }
}
