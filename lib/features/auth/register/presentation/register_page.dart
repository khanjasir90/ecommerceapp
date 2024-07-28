import 'package:ecommerceapp/features/auth/register/presentation/register_view.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: RegisterView()),
    );
  }
}