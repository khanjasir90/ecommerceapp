import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Spacer(),
        Center(child: CircularProgressIndicator()),
        Spacer()
      ],
    );
  }
}
