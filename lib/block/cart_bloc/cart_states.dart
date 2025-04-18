
import '../../model/product/product_model.dart';

abstract class CartState {}

class CartUpdated extends CartState {
  final List<ProductModel> items;

  CartUpdated(this.items);
}