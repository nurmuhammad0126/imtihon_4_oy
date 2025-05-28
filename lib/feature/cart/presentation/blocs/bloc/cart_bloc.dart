import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/cart_model.dart';
import '../../../data/repository/cart_repository.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final CartRepositoryImpl cartRepositoryImpl;
  CartBloc({required this.cartRepositoryImpl})
    : super(CartState(cartStatus: CartStatus.initial)) {
    on<InitProductEvent>(_init);
    on<UpdateProductEvent>((event, emit) {});
  }
  void _init(event, emit) async {
    emit(state.copyWith(cartStatus: CartStatus.load));
    try {
      final carts = await cartRepositoryImpl.fetchCartItems(event.userId);
      emit(state.copyWith(products: carts, cartStatus: CartStatus.succes));
    } catch (e) {
      print("ERROR FETCHING CART ITEMS: $e");
      emit(state.copyWith(cartStatus: CartStatus.error));
    }
  }
}
