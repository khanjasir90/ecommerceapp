import 'package:ecommerceapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBtn extends StatelessWidget {
  const LoginBtn({super.key, required this.btnText, required this.onPressed});

  final String btnText;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final btn = Container(
        margin: EdgeInsets.symmetric(horizontal: 50.w),
        height: 25.h,
        decoration: BoxDecoration(
          color: ECommerceAppTheme.primaryColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Center(
            child: Text(
          btnText,
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(color: ECommerceAppTheme.backgroundColor),
        )));
    return InkWell(
      onTap: onPressed,
      child: btn,
    );
  }
}
