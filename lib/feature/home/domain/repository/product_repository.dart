import '../../data/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts(String categoryId);
}
