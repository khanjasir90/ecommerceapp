import 'package:flutter/material.dart';
import 'package:star_rating/star_rating.dart';

class ProductRating extends StatelessWidget {
  const ProductRating({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return StarRating(
      rating: rating,
      length: 5,
    );
  }
}