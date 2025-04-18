import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/view/products/widget/product_card_widget.dart';
import 'package:go_router/go_router.dart';

import '../../block/product_bloc/product_bloc.dart';
import '../../block/product_bloc/product_events.dart';
import '../../block/product_bloc/product_states.dart';
import '../../components/loading_widget.dart';


class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => context.go('/cart'),
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if (state is ProductInitial) {
            context.read<ProductBloc>().add(FetchProducts());
            return const LoadingWidget();
          } else if (state is ProductLoading) {
            return const LoadingWidget();
          } else if (state is ProductLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(8.0),
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return ProductCardWidget(
                  product: product,
                  onTap: () => context.push('/product/${product.id}'),
                );
              },
            );
          } else if (state is ProductError) {
            return Center(child: Text(state.message));
          }
          return const SizedBox();
        },
      ),
    );
  }
}