import 'package:flutter/material.dart';

import '../widgets/signup_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            SizedBox(height: 80),
            FlutterLogo(size: 100),
            SizedBox(height: 40),

            Text(
              "Welcome!, Please Create an Account",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            SizedBox(height: 40),
            SignupForm(),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
