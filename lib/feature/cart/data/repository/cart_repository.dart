import '../../domain/repository/repository.dart';
import '../datasource/cart_remote_datasource.dart';
import '../model/cart_model.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDatasource remoteDatasource;

  CartRepositoryImpl({required this.remoteDatasource});

  @override
  Future<List<CartModel>> getUserCart(String userId) {
    return remoteDatasource.getUserCart(userId);
  }

  @override
  Future<void> addToCart({
    required String userId,
    required String productId,
    required CartModel cartItem,
  }) {
    return remoteDatasource.addToCart(
      userId: userId,
      productId: productId,
      cartItem: cartItem,
    );
  }

  @override
  Future<List<CartModel>> fetchCartItems(String userId) {
    return remoteDatasource.fetchCartItems(userId);
  }

  @override
  Future<void> addOrder({
    required List<CartModel> carts,
    required userId,
  }) async {
    for (var i in carts) {
      await remoteDatasource.addToOrder(
        userId: userId,
        productId: i.productId,
        cartItem: i,
      );
    }
    await deleteCarts(userId: userId);
  }

  Future<void> deleteCarts({
    required userId,
  }) async {
      await remoteDatasource.deleteCarts(userId);
  }
}
