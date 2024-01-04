import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_shopper/cubits/cart_cubit.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text(
          'Catalog',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 28.0,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              iconSize: 28.0,
              onPressed: () => Navigator.pushNamed(context, '/cart'),
            ),
          ),
        ],
      ),
      body: const ShoppingList(),
    );
  }
}

class ShoppingList extends StatelessWidget {
  const ShoppingList({super.key});

  final int itemCount = 10000; // Infinite scrolling

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartCubit = context.read<CartCubit>();

        // Shop item
        final shopItems = cartCubit.shopItems;
        // Cart item
        final cartItems = cartCubit.cartItems;

        // Colors for items
        List<Color> itemColors = cartCubit.rainbowColors;

        return ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            // Item list
            String item = shopItems[index % shopItems.length];
            Color itemColor = itemColors[index % itemColors.length];

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  color: itemColor,
                ),
                title: Text(
                  item,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
                trailing: IconButton(
                  onPressed: cartItems.contains(item)
                      ? null
                      : () => cartCubit.addToCart(item),
                  icon: cartItems.contains(item)
                      ? const Icon(
                          Icons.check,
                          color: Colors.brown,
                        )
                      : const Text(
                          'ADD',
                          style: TextStyle(
                              color: Colors.brown,
                              fontWeight: FontWeight.normal),
                        ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
