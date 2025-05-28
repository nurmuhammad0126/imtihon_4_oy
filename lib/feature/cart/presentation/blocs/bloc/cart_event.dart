part of 'cart_bloc.dart';

sealed class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class UpdateProductEvent extends CartEvent {
  final CartModel cartModel;

  const UpdateProductEvent({required this.cartModel});
}

class InitProductEvent extends CartEvent {
  final String userId;

  const InitProductEvent({required this.userId});
}

class UpdateCart extends CartEvent{
  final String userId;

  const UpdateCart({required this.userId});
}