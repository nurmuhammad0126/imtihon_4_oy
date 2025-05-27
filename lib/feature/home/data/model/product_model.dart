class ProductModel {
  final String id;
  final String name;
  final String image;
  final double price;
  final double rating;
  final String title;
  final bool like;

  final String categoryId;

  ProductModel({
    this.like = false,
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.rating,
    required this.title,
    required this.categoryId,
  });

  factory ProductModel.formJson(String id, Map<String, dynamic> map) {
    return ProductModel(
      id: id,
      like: map["like"] ?? false,
      name: map['name'] ?? '',
      image: map['image'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      rating: (map['rating'] ?? 0).toDouble(),
      title: map['title'] ?? '',
      categoryId: map['category_id'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "like": like,
      'name': name,
      'image': image,
      'price': price,
      'rating': rating,
      'title': title,
      'category_id': categoryId,
    };
  }

  ProductModel copyWith({
  String? id,
  String? name,
  String? image,
  double? price,
  double? rating,
  String? title,
  bool? like,
  String? categoryId,
}) {
  return ProductModel(
    id: id ?? this.id,
    name: name ?? this.name,
    image: image ?? this.image,
    price: price ?? this.price,
    rating: rating ?? this.rating,
    title: title ?? this.title,
    like: like ?? this.like,
    categoryId: categoryId ?? this.categoryId,
  );
}
}
