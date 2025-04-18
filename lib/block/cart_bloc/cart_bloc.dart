import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/product/product_model.dart';
import 'cart_events.dart';
import 'cart_states.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartUpdated([])) {
    on<AddToCart>((event, emit) {
      final currentState = state as CartUpdated;
      final updatedItems = List<ProductModel>.from(currentState.items)
        ..add(event.product);
      emit(CartUpdated(updatedItems));
    });

    on<RemoveFromCart>((event, emit) {
      final currentState = state as CartUpdated;
      final updatedItems = List<ProductModel>.from(currentState.items)
        ..remove(event.product);
      emit(CartUpdated(updatedItems));
    });
  }
}