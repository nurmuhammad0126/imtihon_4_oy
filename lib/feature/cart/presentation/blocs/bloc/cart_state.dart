part of 'cart_bloc.dart';

enum CartStatus { initial, load, error, succes }

class CartState {
  final List<CartModel>? products;
  final CartStatus cartStatus;
  const CartState({this.products, this.cartStatus = CartStatus.initial});

  CartState copyWith({List<CartModel>? products, CartStatus? cartStatus}) =>
      CartState(
        products: products ?? this.products,
        cartStatus: cartStatus ?? this.cartStatus,
      );
}
