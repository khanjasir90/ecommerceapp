
import 'package:ecommerceapp/features/feed/data/dto/product_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

import '../../../../common_widgets/common_widgets.dart';
import '../../../../utils/utils.dart';

class ProductDetailView extends StatelessWidget {
  const ProductDetailView({super.key, required this.product});

  final Product product;

  Widget _getProductReview(List<Review>? reviews) {
    if (reviews == null || reviews.isEmpty) {
      return const Text('No reviews yet');
    }
    return Column(
      children: [
        const Text('Reviews'),
        Gap(12.h),
        for (Review review in reviews) ...[
          ProductReviewTile(
              rating: double.parse(review.rating.toString()),
              comment: review.comment ?? '',
              name: review.reviewerName ?? '',
              email: review.reviewerEmail ?? '',
              date: review.date.toString()),
        ]
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ProductDetailLayout(
      productImage: ProductImage(
          imageUrl: product.thumbnail ?? '',
          availabilityStatus:
              product.availabilityStatus ?? AvailabilityStatus.LOW_STOCK),
      productName: Text(product.title ?? '',style: Theme.of(context).textTheme.headlineSmall,),
      productBrandName: Text(product.brand ?? '', style: Theme.of(context).textTheme.bodyLarge,),
      productDescription: Text(product.description != null ? 'Description: ${product.description}' : 'Description: NA' , style: Theme.of(context).textTheme.bodyLarge,),
      productRating: ProductRating(rating: product.rating ?? 0.0),
      productPrice: ProductPrice(price: product.price.toString(), showDiscountedPrice: FirebaseHandler().showDiscountedPrice, discountPercentage: product.discountPercentage ?? 0.0, isDetailView: true,),
      productReview: _getProductReview(product.reviews),
      warrantyInfo: Text(product.warrantyInformation != null ? 'Warrenty Info: ${product.warrantyInformation}' : 'Warrant Info: NA', style: Theme.of(context).textTheme.bodyLarge,),
      shippingInfo: Text(product.shippingInformation != null ? 'Shipping Info: ${product.shippingInformation}' : 'Shipping Info: NA', style: Theme.of(context).textTheme.bodyLarge,),
      stocksLeft: Text('Stocks Left: ${product.stock}', style: Theme.of(context).textTheme.bodyLarge,),
    );
  }
}

class ProductDetailLayout extends StatelessWidget {
  const ProductDetailLayout(
      {super.key,
      required this.productImage,
      required this.productName,
      required this.productBrandName,
      required this.productDescription,
      required this.productRating,
      required this.productPrice,
      required this.productReview,
      required this.warrantyInfo,
      required this.shippingInfo,
      required this.stocksLeft
    });

  final Widget productImage;
  final Widget productName;
  final Widget productBrandName;
  final Widget productDescription;
  final Widget productRating;
  final Widget productPrice;
  final Widget productReview;
  final Widget warrantyInfo;
  final Widget shippingInfo;
  final Widget stocksLeft;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Detail'),
      ),
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [productImage],
              ),
              Gap(12.h),
              productPrice,
              Gap(6.h),
              productName,
              Gap(6.h),
              productBrandName,
              Gap(3.h),
              Divider(height: 1.h,),
              Gap(3.h),
              productDescription,
              Gap(3.h),
              Divider(height: 1.h,),
              Gap(3.h),
              warrantyInfo,
              Gap(6.h),
              shippingInfo,
              Gap(6.h),
              stocksLeft,
              Gap(3.h),
              Divider(height: 1.h,),
              Gap(3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  productRating,
                ],
              ),
              Gap(6.h),
              productReview,
            ],
          ),
        ),
      )),
    );
  }
}
