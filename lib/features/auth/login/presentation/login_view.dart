import 'package:ecommerceapp/common_widgets/auth_widgets/auth_textfield.dart';
import 'package:ecommerceapp/common_widgets/auth_widgets/login_button.dart';
import 'package:ecommerceapp/common_widgets/auth_widgets/other_options.dart';
import 'package:ecommerceapp/features/auth/login/data/login_repo_impl.dart';
import 'package:ecommerceapp/features/auth/login/data/source/login_client.dart';
import 'package:ecommerceapp/features/auth/register/presentation/register_page.dart';
import 'package:ecommerceapp/features/feed/presentation/view/product_feed_page.dart';
import 'package:ecommerceapp/utils/constants.dart';
import 'package:ecommerceapp/utils/firebase_handler.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();
  LoginRepoImpl loginRepoImpl = LoginRepoImpl(
      loginClient: LoginClientImpl(firebaseHandler: FirebaseHandler()));

  void _navigateToProductFeedpage(BuildContext context) {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const ProductFeedPage()));
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  void checkIfUserExist(BuildContext context) async {
    loginRepoImpl
        .login(userNameTextEditingController.text,
            passwordTextEditingController.text)
        .then((bool userExist) {
      if (userExist) {
        _navigateToProductFeedpage(context);
      } else {
        _showSnackBar(context, Strings.userDoesNotExist);
      }
    });
  }

  void _validate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      checkIfUserExist(context);
    }
  }

  void _navigateToRegsiterPage(BuildContext context) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const RegisterPage()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ECommerceAppTheme.backgroundColor,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
              child: Text(
                Strings.eShop,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(color: ECommerceAppTheme.primaryColor),
              )),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthTextfield(
                    labelText: Strings.email,
                    textEditingController: userNameTextEditingController,
                    validator: (String? value) {
                      return Validator.validateEmail(value);
                    },
                  ),
                  Gap(12.h),
                  AuthTextfield(
                    labelText: Strings.password,
                    textEditingController: passwordTextEditingController,
                    validator: (String? value) {
                      return Validator.validatePassword(value);
                    },
                  ),
                  Gap(12.h),
                ],
              ),
            ),
          ),
          const Spacer(),
          LoginBtn(btnText: Strings.loginBtnText, onPressed: () => _validate(context)),
          Gap(4.h),
          OtherOptions(
              parentText: Strings.newHere,
              childText: Strings.signupBtnText,
              onPressed: () => _navigateToRegsiterPage(context)),
          Gap(4.h),
        ],
      ),
    );
  }
}
