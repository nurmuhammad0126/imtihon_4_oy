import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/product_model.dart';

abstract class _ProductRemoteDataSource {
  Future<List<ProductModel>> getProductsByCategory(String categoryId);
  Future<void> addProduct(ProductModel p);
}

class ProductRemoteDataSourceImpl implements _ProductRemoteDataSource {
  final FirebaseFirestore firestore;

  ProductRemoteDataSourceImpl(this.firestore);

  @override
  Future<List<ProductModel>> getProductsByCategory(String categoryId) async {
    final snapshot =
        await firestore
            .collection('products')
            .where('category_id', isEqualTo: categoryId)
            .get();

    return snapshot.docs
        .map((doc) => ProductModel.formJson(doc.id, doc.data()))
        .toList();
  }

  @override
  Future<void> addProduct(ProductModel p) async {
    await FirebaseFirestore.instance.collection('products').add(p.toJson());
  }
}
