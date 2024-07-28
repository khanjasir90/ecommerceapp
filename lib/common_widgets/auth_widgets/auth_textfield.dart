import 'package:ecommerceapp/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class AuthTextfield extends StatelessWidget {
  const AuthTextfield({super.key, required this.labelText, required this.textEditingController, required this.validator,});

  final String labelText;
  final TextEditingController textEditingController;
  final String? Function(String?) validator;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          hintText: labelText,
          hintStyle: Theme.of(context).textTheme.labelSmall?.copyWith(color: ECommerceAppTheme.blackColor),
          labelStyle: Theme.of(context).textTheme.labelSmall,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        ),
        validator: validator,
      ),
    );
  }
}