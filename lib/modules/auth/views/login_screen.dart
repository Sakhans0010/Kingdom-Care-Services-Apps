import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/modules/auth/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              "Welcome!, Please Sign In",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            SizedBox(height: 40),
            LoginForm(),
          ],
        ),
      ),
    );
  }
}
