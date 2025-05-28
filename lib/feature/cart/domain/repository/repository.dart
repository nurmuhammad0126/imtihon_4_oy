
import '../../data/model/cart_model.dart';

abstract class CartRepository {
  Future<List<CartModel>> getUserCart(String userId);
  Future<void> addToCart({
    required String userId,
    required String productId,
    required CartModel cartItem,
  });
  Future<List<CartModel>> fetchCartItems(String userId);
}
