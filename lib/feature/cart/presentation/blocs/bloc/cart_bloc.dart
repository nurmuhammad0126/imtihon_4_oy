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

    on<UpdateCart>((event, emit) async {
      emit(state.copyWith(cartStatus: CartStatus.load));
      await cartRepositoryImpl.addOrder(
        carts: state.products ?? [],
        userId: event.userId,
      );
      emit(
        state.copyWith(cartStatus: CartStatus.succes, products: [], total: 0),
      );
    });
  }
  void _init(event, emit) async {
    emit(state.copyWith(cartStatus: CartStatus.load));
    try {
      final carts = await cartRepositoryImpl.fetchCartItems(event.userId);
      double sum = 0;
      for (var i in carts) {
        sum += i.total;
      }
      emit(
        state.copyWith(
          products: carts,
          cartStatus: CartStatus.succes,
          total: sum,
        ),
      );
    } catch (e) {
      print("ERROR FETCHING CART ITEMS: $e");
      emit(state.copyWith(cartStatus: CartStatus.error));
    }
  }
}
