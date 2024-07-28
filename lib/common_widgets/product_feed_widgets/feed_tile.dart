import 'package:ecommerceapp/common_widgets/product_feed_widgets/product_brand_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FeedTile extends StatelessWidget {
  const FeedTile({
    super.key,
    required this.thumnail,
    required this.productName,
    required this.brandName,
    required this.price,
    required this.rating,
  });

  final Widget thumnail;
  final Widget productName;
  final Widget brandName;
  final Widget price;
  final Widget rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          thumnail,
          Gap(6.h),
          productName,
          Gap(4.h),
          price,
          Gap(4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              rating,
            ],
          )
        ],
      ),
    );
  }
}
