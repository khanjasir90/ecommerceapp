import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProductPrice extends StatelessWidget {
  const ProductPrice(
      {super.key,
      required this.price,
      this.showDiscountedPrice = false,
      this.discountPercentage = 0,
      this.isDetailView = false});

  final String price;

  final bool showDiscountedPrice;

  final double discountPercentage;

  final bool isDetailView;

  double discountedPrice() {
    return double.parse(price) -
        (double.parse(price) * discountPercentage / 100);
  }

  TextStyle getPriceTextStyle(BuildContext context) {
    if (isDetailView) {
      return Theme.of(context).textTheme.bodyLarge!;
    }
    return Theme.of(context).textTheme.labelSmall!;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Rs $price',
            style: getPriceTextStyle(context).copyWith(
                decoration: showDiscountedPrice
                    ? TextDecoration.lineThrough
                    : TextDecoration.none)),
        Gap(4.h),
        if (showDiscountedPrice) ...[
          Text(
            'Rs ${discountedPrice().toStringAsFixed(2)}',
            style: getPriceTextStyle(context),
          ),
          Gap(4.h),
          if(isDetailView) ... [
             Container(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: Colors.lightGreen,
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Text(
              '(${discountPercentage.toStringAsFixed(2)}% off)',
              style: getPriceTextStyle(context).copyWith(color: Colors.white),
            ),
          ),
          ]
        ]
      ],
    );
  }
}
