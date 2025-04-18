import 'package:flutter_block/repository/product_api/product_api_repository.dart';

import '../../data/network/network_api_services.dart';
import '../../model/product/product_model.dart';
import '../../utils/app_url.dart';

class ProductHttpApiRepository implements ProductApiRepository {
  final NetworkApiServices _apiServices;

  ProductHttpApiRepository(this._apiServices);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await _apiServices.getApi(AppUrl.productsUrl);
    return (response as List)
        .map((json) => ProductModel.fromJson(json))
        .toList();
  }
}
