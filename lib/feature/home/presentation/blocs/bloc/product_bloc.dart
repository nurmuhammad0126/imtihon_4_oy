import 'package:exam_4/feature/home/data/model/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repository/product_repository.dart';
import 'product_state.dart';

part 'product_event.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductRepository repository;

  ProductBloc(this.repository) : super(ProductInitial()) {
    on<LoadProducts>(_loading);
     on<UpdateProductEvent>(_updateProduct);
  }

  void _loading(event, emit) async {
    emit(ProductLoading());
    try {
      final products = await repository.getProducts(event.categoryId);
      emit(ProductLoaded(products));
    } catch (e) {
      emit(ProductError(e.toString()));
    }
  }


 void _updateProduct(UpdateProductEvent event, Emitter<ProductState> emit) async {
    if (state is ProductLoaded) {
      final currentState = state as ProductLoaded;

      final updatedProduct = event.productModel.copyWith(like: !event.productModel.like);

      try {
        await repository.updateProduct(updatedProduct);
        final updatedList = currentState.products.map((product) {
          return product.id == updatedProduct.id ? updatedProduct : product;
        }).toList();

        emit(ProductLoaded(updatedList));
      } catch (e) {
        emit(ProductError("Failed to update like: $e"));
      }
    }
  }
}
