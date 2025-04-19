import 'package:get_it/get_it.dart';

import '../../block/auth_bloc/auth_bloc.dart';
import '../../block/block_post/block_post_block.dart';
import '../../block/cart_bloc/cart_bloc.dart';
import '../../block/product_bloc/product_bloc.dart';
import '../../repository/auth_api/auth_api_repository.dart';
import '../../repository/auth_api/auth_http_api_repository.dart';
import '../../repository/product_api/product_api_repository.dart';
import '../../repository/product_api/product_http_api_repository.dart';
import '../network/network_api_services.dart';

final locator = GetIt.instance;

void setupLocator() {
  // Services
  locator.registerLazySingleton(() => NetworkApiServices());

  // Repositories
  locator.registerLazySingleton<AuthApiRepository>(
    () => AuthHttpApiRepository(locator()),
  );
  locator.registerLazySingleton<ProductApiRepository>(
    () => ProductHttpApiRepository(locator()),
  );

  // Blocs
  locator.registerFactory(() => AuthBloc(locator()));
  locator.registerFactory(() => ProductBloc(locator()));
  locator.registerFactory(() => CartBloc());
  locator.registerFactory(() => PostBloc());
}
