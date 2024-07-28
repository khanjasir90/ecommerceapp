import 'package:ecommerceapp/features/auth/login/presentation/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyBMl9JV10djyoG8WHwSsSzLRW79Zs4wUwA',
      appId: '1:1000184848958:android:0a5c3ad0c105be4a25e76f',
      messagingSenderId: '1000184848958', // Make sure this is correct
      projectId: 'ecommerce-537fa',
      storageBucket: 'ecommerce-537fa.appspot.com', // Add if needed
    ),
  );
  await FirebaseHandler().initializeRemoteConfig();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 390),
      builder: (context, child) {
        return MaterialApp(
          title: Strings.appName,
          theme: ECommerceAppTheme.themeData,
          home: child,
        );
      },
      child: const LoginPage(),
    );
  }
}