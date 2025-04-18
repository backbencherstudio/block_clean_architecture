
import '../../model/product/product_model.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final ProductModel product;

  AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final ProductModel product;

  RemoveFromCart(this.product);
}