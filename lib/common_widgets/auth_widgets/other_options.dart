import 'package:ecommerceapp/utils/theme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class OtherOptions extends StatelessWidget {
  const OtherOptions({
    super.key,
    required this.parentText,
    required this.childText,
    required this.onPressed,
  });

  final String parentText;
  final String childText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
          text: TextSpan(
        text: parentText,
        style: Theme.of(context).textTheme.bodyLarge,
        children: [
          TextSpan(
            text: childText,
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(color: ECommerceAppTheme.primaryColor),
            recognizer: TapGestureRecognizer()..onTap = () => onPressed(),
          ),
        ],
      )),
    );
  }
}
