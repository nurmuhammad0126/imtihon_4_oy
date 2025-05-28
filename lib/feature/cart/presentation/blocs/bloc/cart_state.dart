part of 'cart_bloc.dart';

enum CartStatus { initial, load, error, succes }

class CartState {
  final List<CartModel>? products;
  final double? total;
  final CartStatus cartStatus;
  
  const CartState({
    this.products,
    this.total,
    this.cartStatus = CartStatus.initial,
  });

  CartState copyWith({
    List<CartModel>? products,
    CartStatus? cartStatus,
    double? total,
  }) => CartState(
    total: total ?? this.total,
    products: products ?? this.products,
    cartStatus: cartStatus ?? this.cartStatus,
  );
}
