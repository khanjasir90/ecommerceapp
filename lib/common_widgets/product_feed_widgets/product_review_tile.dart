import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:star_rating/star_rating.dart';

class ProductReviewTile extends StatelessWidget {
  const ProductReviewTile({super.key, required this.rating, required this.comment, required this.name, required this.email, required this.date});

  final double rating;
  final String comment;
  final String name;
  final String email;
  final String date;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('- $comment', style: Theme.of(context).textTheme.bodyLarge,),
        Text('Name: $name', style: Theme.of(context).textTheme.bodyMedium,),
        Text('Email: $email', style: Theme.of(context).textTheme.bodyMedium,),
        Text('Date: $date', style: Theme.of(context).textTheme.bodyMedium,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            StarRating(
              rating: rating,
              length: 5,
            ),
          ],
        ),
        Gap(4.h),
        Divider(height: 1.h,),
      ],
    );
  }
}