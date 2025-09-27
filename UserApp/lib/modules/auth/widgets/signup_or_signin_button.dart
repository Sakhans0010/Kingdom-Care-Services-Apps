import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

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
      child:
          // Signup link
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: Theme.of(context).textTheme.bodySmall,
                // TextStyle(fontSize: 14, color: AppColors.neutral500),
              ),
              TextButton(
                onPressed: () => onButtonTapped(),
                child: Text(
                  buttonText,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),

      // Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Text(text, style: Theme.of(context).textTheme.bodyMedium),
      //     TextButton(
      //       onPressed: () => onButtonTapped(),
      //       child: Text(
      //         buttonText,
      //         style: Theme.of(context).textTheme.bodyMedium!.copyWith(
      //           color: Theme.of(context).colorScheme.primary,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
