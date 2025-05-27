abstract class ItemsModel {
  final int total;
  final int count;
  final String size;

  const ItemsModel({required this.total, required this.count, required this.size});

 factory ItemsModel.fromJson(Map<String, dynamic> json) =>
      ProductModelImpl.fromJson(json);

  Map<String, dynamic> toJson();
}

class ProductModelImpl extends ItemsModel {
  const ProductModelImpl({
    required super.total,
    required super.count,
    required super.size,
  });

  factory ProductModelImpl.fromJson(Map<String, dynamic> json) {
    return ProductModelImpl(
      total: json['total'] ?? 0,
      count: json['count'] ?? 0,
      size: json['size'] ?? '',
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'total': total,
      'count': count,
      'size': size,
    };
  }
}
