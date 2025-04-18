import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';


import '../../block/cart_bloc/cart_bloc.dart';
import '../../block/cart_bloc/cart_events.dart';
import '../../block/cart_bloc/cart_states.dart';
import '../../components/round_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated && state.items.isEmpty) {
            return const Center(child: Text('Your cart is empty'));
          } else if (state is CartUpdated) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.items.length,
              itemBuilder: (context, index) {
                final item = state.items[index];
                return ListTile(
                  leading: CachedNetworkImage(
                    imageUrl: item.image,
                    width: 50,
                    height: 50,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                  title: Text(item.title),
                  subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle),
                    onPressed: () {
                      context.read<CartBloc>().add(RemoveFromCart(item));
                    },
                  ),
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated && state.items.isNotEmpty) {
            final total = state.items.fold<double>(
              0,
                  (sum, item) => sum + item.price,
            );
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: RoundButton(
                label: 'Checkout (\$${total.toStringAsFixed(2)})',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Checkout not implemented')),
                  );
                },
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}