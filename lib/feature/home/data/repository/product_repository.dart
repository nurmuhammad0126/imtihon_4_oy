import '../../domain/repository/product_repository.dart';
import '../datasource/product_remote_datasource.dart';
import '../model/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSourceImpl remoteDataSourceImple;

  ProductRepositoryImpl(this.remoteDataSourceImple);

  @override
  Future<List<ProductModel>> getProducts(String categoryId) {
    return remoteDataSourceImple.getProductsByCategory(categoryId);
  }

  @override
  Future<void> updateProduct(ProductModel product) async {
    await remoteDataSourceImple.updateProduct(product);
  }
}
