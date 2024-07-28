import 'package:ecommerceapp/features/feed/data/dto/product_dto.dart';
import 'package:flutter/material.dart';

enum Status {
  loading,
  loaded,
  error,
  empty,
}

enum Filter {
  price,
  rating,
  availabilityStatus,
  review,
  na,
}

class ProductFeedChangeNotifier extends ChangeNotifier {
  ProductFeedChangeNotifier({required ProductDto productFeed})
      : _productFeed = productFeed;

  final ProductDto _productFeed;
  
  Status _status = Status.loading;

  Filter _filter = Filter.na;

  String _searchQuery = '';


  ProductDto get productFeed {
    ProductDto product = _productFeed;
    if(filter == Filter.price) {
      product.products?.sort((a, b) => a.price!.compareTo(b.price!));
    } else if(filter == Filter.rating) {
      product.products?.sort((a, b) => a.rating!.compareTo(b.rating!));
    } else if(filter == Filter.availabilityStatus) {
      product.products?.sort((a, b) {
        if(a.availabilityStatus == AvailabilityStatus.IN_STOCK) {
          return -1;
        } else {
          return 1;
        }
      });
    } else if(filter == Filter.review) {
      product.products?.sort((a, b) => a.reviews!.length.compareTo(b.reviews!.length));
    }
    return _filterSearch(product);
  }
  
  Status get status => _status;

  Filter get filter => _filter;

  void setFilter(Filter rating) {
    _filter = rating;
    notifyListeners();
  }

  void setSearchQuery(String searchQuery) {
    _searchQuery = searchQuery;
    notifyListeners();
  }

  ProductDto _filterSearch(ProductDto productFeed) {
    if(_searchQuery.isEmpty) {
      return productFeed;
    }
    return ProductDto(
      products: productFeed.products?.where((element) => element.title!.toLowerCase().contains(_searchQuery.toLowerCase())).toList(),
    );
  }
 
}
