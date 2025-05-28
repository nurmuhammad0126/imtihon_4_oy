part of 'order_bloc.dart';
enum OrderStatus { initial, load, error, succes }

class OrderState {
  final List<OrderModel>? products;
  final double? total;
  final OrderStatus cartStatus;
  
  const OrderState({
    this.products,
    this.total,
    this.cartStatus = OrderStatus.initial,
  });

  OrderState copyWith({
    List<OrderModel>? products,
    OrderStatus? cartStatus,
    double? total,
  }) => OrderState(
    total: total ?? this.total,
    products: products ?? this.products,
    cartStatus: cartStatus ?? this.cartStatus,
  );
}
