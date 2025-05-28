import '../../../data/model/product_model.dart';

class ProductDetailState {
  final List<String>? sizes;
  final int? currentIndex;
  final double? total;
  final int? count;
  final double? price;
  final bool bottonAddCart;

  const ProductDetailState({
    this.bottonAddCart = false,
    this.price,
    this.total,
    this.count,
    this.sizes,
    this.currentIndex,
  });

  factory ProductDetailState.init(ProductModel p) => ProductDetailState(
    total: p.price,
    price: p.price,
    bottonAddCart: false,
    count: 1,
    sizes: ["10”", "14”", "16”"],
    currentIndex: 0,
  );

  ProductDetailState copyWith({
    bool? bottonAddCart,
    List<String>? sizes,
    int? currentIndex,
    double? total,
    int? count,
    double? price,
  }) => ProductDetailState(
    bottonAddCart: bottonAddCart ?? this.bottonAddCart,
    price: price ?? this.price,
    sizes: sizes ?? this.sizes,
    currentIndex: currentIndex ?? this.currentIndex,
    total: total ?? this.total,
    count: count ?? this.count,
  );
}
