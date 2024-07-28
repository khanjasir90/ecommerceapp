import 'package:dio/dio.dart';
import 'package:ecommerceapp/features/feed/data/dto/product_dto.dart';

abstract class ProductFeedClient {
  Future<ProductDto> getAllProductsFeed();
}

class ProductFeedClientImpl implements ProductFeedClient {

  String get _endpoint => 'https://dummyjson.com/products';

  final Dio _dio = Dio();

  @override
  Future<ProductDto> getAllProductsFeed() async {
    final Response response = await _dio.get(_endpoint);
    final Map<String,dynamic> data = response.data as Map<String,dynamic>;
    final List<dynamic> products = data['products'] as List<dynamic>;
    final product = products.map((e) => Product.fromJson(e)).toList();
    return ProductDto(products: product);
  }
}