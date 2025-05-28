import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/cart_model.dart';

class CartRemoteDatasource {
  final FirebaseFirestore firestore;

  CartRemoteDatasource(this.firestore);

  Future<List<CartModel>> getUserCart(String userId) async {
    final cartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('carts');

    final snapshot = await cartRef.get();

    return snapshot.docs.map((doc) {
      return CartModel.fromJson(doc.id, doc.data());
    }).toList();
  }

  Future<void> addToCart({
    required String userId,
    required String productId,
    required CartModel cartItem,
  }) async {
    final cartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('carts')
        .doc(productId);

    await cartRef.set(cartItem.toJson());
  }

  Future<void> addToOrder({
    required String userId,
    required String productId,
    required CartModel cartItem,
  }) async {
    final cartRef = FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .collection('orders')
        .doc(productId);

    await cartRef.set(cartItem.toJson());
  }

  Future<List<CartModel>> fetchCartItems(String userId) async {
    final snapshot =
        await firestore
            .collection('users')
            .doc(userId)
            .collection('carts')
            .get();
    print("DOCS LENGTH: ${snapshot.docs.length}");

    return snapshot.docs
        .map((doc) => CartModel.fromJson(doc.id, doc.data()))
        .toList();
  }

  Future<void> updateCart(String userId, CartModel cart) async {
    firestore
        .collection("users")
        .doc(userId)
        .collection("carts")
        .doc(cart.productId)
        .update({"count": cart.count, "size": cart.size, "total": cart.total});
  }

  Future<void> deleteCarts(String userId) async {
    final cartsRef = firestore
        .collection("users")
        .doc(userId)
        .collection("carts");

    try {
      final snapshot = await cartsRef.get();

      if (snapshot.docs.isEmpty) return;

      final WriteBatch batch = firestore.batch();

      for (final doc in snapshot.docs) {
        batch.delete(doc.reference);
      }

      await batch.commit();
    } catch (e) {
      print("Carts o‘chirishda xatolik: $e");
      rethrow;
    }
  }
}
