import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/datasource/order_remote_datasource.dart';
import '../../data/model/order_model.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final OrderRemoteDatasource orderRemoteDatasource;
  OrderBloc({required this.orderRemoteDatasource})
    : super(OrderState()) {
    on<InitialProductEvent>(_init);
    
  }
  void _init(event, emit) async {
    emit(state.copyWith(cartStatus: OrderStatus.initial));
    try {
      final orders = await orderRemoteDatasource.fetchOrderItems(event.userId);
      double sum = 0;
      for (var i in orders) {
        sum += i.total;
      }
      emit(
        state.copyWith(
          products: orders,
          cartStatus: OrderStatus.succes,
          total: sum,
        ),
      );
    } catch (e) {
      print("ERROR FETCHING CART ITEMS: $e");
      emit(state.copyWith(cartStatus: OrderStatus.error));
    }
  }
}
