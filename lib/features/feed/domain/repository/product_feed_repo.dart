import 'package:ecommerceapp/features/feed/data/dto/product_dto.dart';

abstract class ProductFeedRepo {
  Future<ProductDto> getAllProductFeed();
}