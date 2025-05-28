part of "order_bloc.dart";

sealed class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}
class InitialProductEvent extends OrderEvent {
  final String userId;

  const InitialProductEvent({required this.userId});
}
