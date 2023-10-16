import 'package:flutter/material.dart';

class LogoHeaderWidget extends StatelessWidget {
  const LogoHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset(
          'assets/logo.png',
          width: 108,
          height: 45,
        ),
        const SizedBox(),
      ],
    );
  }
}