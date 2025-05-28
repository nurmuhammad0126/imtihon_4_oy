import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_4/feature/home/data/model/product_model.dart';
import '../../feature/auth/data/model/user_model.dart';

class UserRemoteService {
  final FirebaseFirestore _firestore;

  UserRemoteService(this._firestore);

  Future<UserModel?> getUser(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();

      if (doc.exists && doc.data() != null) {
        return UserModel.fromJson(doc.id, doc.data() ?? {});
      }
      return null;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser(UserModel user) async {
    try {
      await _firestore.collection('users').doc(user.id).update(user.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUser(String userId) async {
    try {
      await _firestore.collection('users').doc(userId).delete();
    } catch (e) {
      rethrow;
    }
  }

  Future<ProductModel?> getProductId(String id) async {
    try {
      print("ID: KELDI ${id}");

      final data = await _firestore.collection("products").doc(id).get();
      print("DATA: KELDI ${data.data()}");
      final ProductModel pro = ProductModel.formJson(id, data.data() ?? {});

      return pro;
    } catch (e) {
      print("GET PRODUCT ID ERROR: $e");
    }
    return null;
  }
}
