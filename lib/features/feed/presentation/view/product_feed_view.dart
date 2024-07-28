
import 'package:ecommerceapp/common_widgets/product_feed_widgets/feed_tile.dart';
import 'package:ecommerceapp/common_widgets/product_feed_widgets/product_brand_name.dart';
import 'package:ecommerceapp/common_widgets/product_feed_widgets/product_filter.dart';
import 'package:ecommerceapp/common_widgets/product_feed_widgets/product_image.dart';
import 'package:ecommerceapp/common_widgets/product_feed_widgets/product_name.dart';
import 'package:ecommerceapp/common_widgets/product_feed_widgets/product_price.dart';
import 'package:ecommerceapp/common_widgets/product_feed_widgets/product_rating.dart';
import 'package:ecommerceapp/features/feed/data/dto/product_dto.dart';
import 'package:ecommerceapp/features/feed/presentation/change_notifier/product_feed_change_notifier.dart';
import 'package:ecommerceapp/features/feed/presentation/view/product_detail_view.dart';
import 'package:ecommerceapp/utils/firebase_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ProductFeedView extends StatelessWidget {
  const ProductFeedView({super.key});

  void onTapProduct(BuildContext context, Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailView(product: product)));
  }

  @override
  Widget build(BuildContext context) {
    final bool showDiscountedPrice = FirebaseHandler().showDiscountedPrice;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Gap(12.h),
        ProductFilter(
          searchController: TextEditingController(),
        ),
        Gap(12.h),
        Expanded(
          child: Consumer<ProductFeedChangeNotifier>(
            builder: (context, productFeedProvider, child) {
              final ProductDto productFeed = productFeedProvider.productFeed;
              return GridView.builder(
                //shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: productFeed.products?.length ?? 0,
                itemBuilder: (BuildContext context, int index) {
                  final product = productFeed.products?[index];
                  final Widget feedTile = FeedTile(
                    thumnail: Flexible(
                      child: ProductImage(
                        imageUrl: product?.thumbnail ?? '',
                        availabilityStatus: product?.availabilityStatus ??
                            AvailabilityStatus.IN_STOCK,
                        width: 200.w,
                        height: 50.h,
                      ),
                    ),
                    productName: ProductName(productName: product?.title ?? ''),
                    brandName: ProductBranchName(brandName: product?.brand ?? ''),
                    price: ProductPrice(
                      price: product?.price.toString() ?? '',
                      showDiscountedPrice: showDiscountedPrice,
                      discountPercentage: product?.discountPercentage ?? 0.0,
                    ),
                    rating: ProductRating(rating: product?.rating ?? 0.0),
                  );
                  return InkWell(
                      onTap: () => onTapProduct(context, product!),
                      child: feedTile);
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
