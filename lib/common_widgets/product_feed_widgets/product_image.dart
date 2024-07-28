import 'package:ecommerceapp/features/feed/data/dto/product_dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.imageUrl, required this.availabilityStatus, this.width, this.height});

  final String imageUrl;
  final AvailabilityStatus availabilityStatus;
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Badge(
      label: Text(availabilityStatus.name),
      offset: Offset(-30.r, 5.r),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Image.network(imageUrl, fit: BoxFit.fill),
      ),
    );
  }
}