import 'package:flutter/material.dart';

class NotPermitted extends StatelessWidget {
  const NotPermitted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Image.asset(
                'assets/logo.png',
                fit: BoxFit.contain,
                height: 150,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'ERROR: something went wrong',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
