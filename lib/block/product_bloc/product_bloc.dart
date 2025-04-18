
import 'package:bloc/bloc.dart';
import 'package:flutter_block/block/product_bloc/product_events.dart';
import 'package:flutter_block/block/product_bloc/product_states.dart';

import '../../repository/product_api/product_api_repository.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductApiRepository _repository;

  ProductBloc(this._repository) : super(ProductInitial()) {
    on<FetchProducts>((event, emit) async {
      emit(ProductLoading());
      try {
        final products = await _repository.getProducts();
        emit(ProductLoaded(products));
      } catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }
}