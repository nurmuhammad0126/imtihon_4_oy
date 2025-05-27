part of 'product_bloc.dart';

sealed class ProductEvent {}

class LoadProducts extends ProductEvent {
  final String categoryId;

  LoadProducts(this.categoryId);
}
