import 'package:flutter/material.dart';

class ProductBranchName extends StatelessWidget {
  const ProductBranchName({super.key, required this.brandName});

  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Text(brandName);
  }
}