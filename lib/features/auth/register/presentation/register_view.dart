
import 'package:ecommerceapp/common_widgets/auth_widgets/auth_widgets.dart';
import 'package:ecommerceapp/features/auth/login/presentation/login_page.dart';
import 'package:ecommerceapp/features/auth/register/data/register_repo_impl.dart';
import 'package:ecommerceapp/features/auth/register/data/source/register_client.dart';
import 'package:ecommerceapp/features/auth/register/domain/register_repo.dart';
import 'package:ecommerceapp/utils/constants.dart';
import 'package:ecommerceapp/utils/firebase_handler.dart';
import 'package:ecommerceapp/utils/theme.dart';
import 'package:ecommerceapp/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userNameTextEditingController = TextEditingController();
  final TextEditingController passwordTextEditingController = TextEditingController();
  final RegisterRepo registerRepo = RegisterRepoImpl(registerClient: RegisterClientImpl(firebaseHandler: FirebaseHandler()));

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }
  
  void _saveUser(BuildContext context) {
    registerRepo.register(userNameTextEditingController.text, passwordTextEditingController.text).then((bool isUserDataSaved) {
      if(isUserDataSaved) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        _showSnackBar(context, Strings.userAlreadyExist);
      }
    });
  }

  void _validate(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      _saveUser(context);
    }
  }

  void _navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
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
          Padding(padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h), child: Text(Strings.eShop,style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: ECommerceAppTheme.primaryColor),)),
          const Spacer(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.r),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  AuthTextfield(labelText: Strings.email, textEditingController: userNameTextEditingController, validator: (String? value) {
                    return Validator.validateEmail(value);
                  }),
                  Gap(12.h),
                  AuthTextfield(labelText: Strings.password, textEditingController: passwordTextEditingController, validator: (String? value) {
                    return Validator.validatePassword(value);
                  },),
                  Gap(12.h),
                ],
              ),
            ),
          ),
          const Spacer(),
          LoginBtn(btnText: Strings.signupBtnText, onPressed: () => _validate(context)),
          Gap(4.h),
          OtherOptions(parentText: Strings.alreadyHaveAnAccount, childText: Strings.loginBtnText, onPressed: () => _navigateToLogin(context)),
          Gap(4.h),
        ],
      ),
    );
  }
}