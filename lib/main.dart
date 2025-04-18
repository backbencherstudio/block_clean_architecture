import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_block/routes/routes.dart';
import 'package:flutter_block/themes/theme_config.dart';
import 'block/auth_bloc/auth_bloc.dart';
import 'block/cart_bloc/cart_bloc.dart';
import 'block/product_bloc/product_bloc.dart';
import 'data/dependency_injection/dependency_injection.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => locator<AuthBloc>()),
        BlocProvider(create: (_) => locator<ProductBloc>()),
        BlocProvider(create: (_) => locator<CartBloc>()),
      ],
      child: MaterialApp.router(
        title: 'ECommerce App',
        theme: AppThemes.lightTheme,
        darkTheme: AppThemes.darkTheme,
        themeMode: ThemeMode.system,
        routerConfig: AppRouter.router,
      ),
    );
  }
}
