
class OrderModel {
  final String productId;
  final double total;
  final int count;
  final String size;

  const OrderModel({
    required this.productId, 
    required this.total,
    required this.count,
    required this.size,
  });

  factory OrderModel.fromJson(String id,Map<String, dynamic> json) {
    return OrderModel(
      productId: id,
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      count: json['count'] as int? ?? 0,
      size: json['size'] as String? ?? '',
    );
  }
  Map<String, dynamic> toJson() {

    return {'total': total, 'count': count, 'size': size};
  }
}
