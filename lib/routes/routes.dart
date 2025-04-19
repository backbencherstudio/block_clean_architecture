import 'package:go_router/go_router.dart';
import '../view/block_post/block_post_list.dart';
import '../view/cart/cart_screen.dart';
import '../view/login/login_screen.dart';
import '../view/products/product_detail_screen.dart';
import '../view/products/product_list_screen.dart';
import 'routes_name.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: RoutesName.login,
    routes: [
      GoRoute(
        path: RoutesName.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: RoutesName.productList,
        builder: (context, state) => const ProductListScreen(),
      ),
      GoRoute(
        path: '/product/:id',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          return ProductDetailScreen(productId: int.parse(id));
        },
      ),
      GoRoute(
        path: RoutesName.cart,
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: RoutesName.postBlock,
        builder: (context, state) => const BlockPostList(),
      ),
    ],
  );
}
