import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/view/products/widget/product_card_widget.dart';
import 'package:go_router/go_router.dart';

import '../../block/product_bloc/product_bloc.dart';
import '../../block/product_bloc/product_events.dart';
import '../../block/product_bloc/product_states.dart';
import '../../block/theme_cubit/theme_cubit.dart';
import '../../components/loading_widget.dart';
class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        backgroundColor: theme.appBarTheme.backgroundColor,
        actions: [
          // 🌙 Light/Dark Mode Switch
          Switch(
            value: isDark,
            onChanged: (value) {
              context.read<ThemeCubit>().toggleTheme(value);
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart, color: theme.iconTheme.color),
            onPressed: () => context.go('/cart'),
          ),
        ],
      ),
      backgroundColor: theme.scaffoldBackgroundColor,
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
            return Center(
              child: Text(state.message, style: theme.textTheme.bodyMedium),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
