import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:exam_4/core/models/items_model.dart';
import 'package:exam_4/core/service/user_local_service.dart';
import 'package:exam_4/feature/home/presentation/blocs/cubit/product_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/product_model.dart';

class ProductDetailCubit extends Cubit<ProductDetailState> {
  ProductDetailCubit() : super(ProductDetailState());

  void init(ProductModel pro) {
    emit(ProductDetailState.init(pro));
  }

  void selectIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void increment() {
    final newCount = (state.count! + 1);
    emit(state.copyWith(count: newCount, total: state.price! * newCount));
  }

  void decrement() {
    if (state.count == null) {
      return;
    }
    if (state.count! > 1) {
      final newCount = (state.count! - 1);
      emit(state.copyWith(count: newCount, total: state.price! * newCount));
    }
  }

  void addToCart(String id) async {
    emit(state.copyWith(bottonAddCart: true));
    final user = await UserLocalService().getUserId();

    if (user == null || user.isEmpty) {
      print("❌ USER ID null yoki bo‘sh");
      emit(state.copyWith(bottonAddCart: false));
      return;
    }

    final item = ItemsModel(
      count: state.count!,
      size: state.sizes![state.currentIndex!],
      total: state.total!,
    );
    try {
    await FirebaseFirestore.instance
          .collection('users')
          .doc(user)
          .collection("carts")
          .doc(id)
          .set(item.toJson());
    } catch (e) {
      print("CARTGA QOSHILMADI XATOLIK BOLDI ! $e");
      emit(state.copyWith(bottonAddCart: false));
    }
    emit(state.copyWith(bottonAddCart: false));
  }

  void addToCartDefoubt() async {
    final user = await UserLocalService().getUserId();

    if (user == null || user.isEmpty) {
      return;
    }

    final item = ItemsModel(
      count: 1,
      size: state.sizes![0],
      total: state.price ?? 0,
    );
    try {
      final a = await FirebaseFirestore.instance
          .collection('users')
          .doc(user)
          .collection("carts")
          .add(item.toJson());
      print(a);
    } catch (e) {
      print("CARTGA QOSHILMADI XATOLIK BOLDI ! $e");
    }
  }

  void changeIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
