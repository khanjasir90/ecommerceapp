import 'package:flutter/material.dart';

class ProductName extends StatelessWidget {
  const ProductName({super.key, required this.productName});

  final String productName;

  @override
  Widget build(BuildContext context) {
    return Text(productName, style: Theme.of(context).textTheme.bodySmall,);
  }
}