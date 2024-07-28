import 'package:ecommerceapp/features/feed/data/dto/product_dto.dart';
import 'package:ecommerceapp/features/feed/data/source/product_feed_client.dart';
import 'package:ecommerceapp/features/feed/domain/repository/product_feed_repo.dart';

class ProductFeedRepoImpl extends ProductFeedRepo {

  ProductFeedRepoImpl({required ProductFeedClient productFeedClient}) : _productFeedClient = productFeedClient;

  final ProductFeedClient _productFeedClient;

  @override
  Future<ProductDto> getAllProductFeed() async {
    return await _productFeedClient.getAllProductsFeed();
  }

}