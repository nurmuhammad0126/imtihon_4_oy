class ItemsModel {
  final double total;
  final int count;
  final String size;

  const ItemsModel({
    required this.total,
    required this.count,
    required this.size,
  });

  factory ItemsModel.fromJson(Map<String, dynamic> json) {
    return ItemsModel(
      total: (json['total'] as num?)?.toDouble() ?? 0.0,
      count: json['count'] as int? ?? 0,
      size: json['size'] as String? ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {'total': total, 'count': count, 'size': size};
  }
}
