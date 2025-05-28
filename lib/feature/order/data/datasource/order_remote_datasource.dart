import 'package:cloud_firestore/cloud_firestore.dart';

import '../model/order_model.dart';

class OrderRemoteDatasource {
  final FirebaseFirestore firestore;

  OrderRemoteDatasource(this.firestore);

  Future<List<OrderModel>> fetchOrderItems(String userId) async {
    final snapshot =
        await firestore
            .collection('users')
            .doc(userId)
            .collection('orders')
            .get();
    print("DOCS LENGTH: ${snapshot.docs.length}");

    return snapshot.docs
        .map((doc) => OrderModel.fromJson(doc.id, doc.data()))
        .toList();
  }
}
