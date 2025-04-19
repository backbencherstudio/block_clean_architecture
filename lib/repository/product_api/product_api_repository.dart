import '../../model/product/product_model.dart';

abstract class ProductApiRepository {
  Future<List<ProductModel>> getProducts();
}
