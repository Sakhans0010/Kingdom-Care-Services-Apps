import 'package:flutter/material.dart';

class SignUpOrSignInButton extends StatelessWidget {
  final String text;
  final String buttonText;
  final Function onButtonTapped;
  const SignUpOrSignInButton({
    super.key,
    required this.text,
    required this.buttonText,
    required this.onButtonTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(text, style: Theme.of(context).textTheme.bodyMedium),
          TextButton(
            onPressed: () => onButtonTapped(),
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
