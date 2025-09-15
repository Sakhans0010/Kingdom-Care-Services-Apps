import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';
import 'package:kingdom_care_services_app/utils/app_default_theme.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FormFieldSetter? onFiledSubmittedValue;
  final String? Function(String?)? onValidate;
  final Function(String?)? onChanged;
  final Function(PointerDownEvent)? onTapOutside;
  final Function? onSuffixTapped;

  final VoidCallback? onTap;
  final TextInputType? keyBoardType;
  final String? hint;
  final String? label;
  final String? initialValue;
  final bool obscureText;
  final bool readOnly;
  final int? maxLines;
  final bool enable, autoFocus;
  final bool closeKeyboardOnTapOutSide;
  final bool isPasswordTextField;
  final bool isVisible;

  final List<TextInputFormatter>? inputFormatters;
  final AutovalidateMode? autovalidateMode;
  final Widget? suffixIcon;
  final TextCapitalization textCapitalization;

  const CustomTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.initialValue,
    this.onFiledSubmittedValue,
    this.onChanged,
    this.onTap,
    this.onValidate,
    this.onTapOutside,
    this.onSuffixTapped,
    this.autovalidateMode,
    this.suffixIcon,
    this.keyBoardType,
    this.hint,
    this.label,
    this.obscureText = false,
    this.readOnly = false,
    this.inputFormatters,
    this.enable = true,
    this.autoFocus = false,
    this.isVisible = false,
    this.isPasswordTextField = false,
    this.closeKeyboardOnTapOutSide = true,
    this.maxLines = 1,
    this.textCapitalization = TextCapitalization.none,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        style: AppThemes.textThemeContext.bodyMedium!.copyWith(
          fontWeight: FontWeight.w600,
          color: AppColors.primaryColor,
        ),

        readOnly: readOnly,
        obscureText: obscureText,
        autovalidateMode: autovalidateMode,
        cursorColor: AppColors.primaryColor,
        maxLines: maxLines,
        decoration: InputDecoration(
          focusColor: AppThemes.colorContext.secondary,
          hoverColor: AppThemes.colorContext.secondary,
          contentPadding: const EdgeInsets.all(15.0),
          hintText: hint,
          labelText: label,
          hintStyle: AppThemes.textThemeContext.bodySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 134, 131, 131),
          ),
          labelStyle: AppThemes.textThemeContext.bodySmall!.copyWith(
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 134, 131, 131),
          ),
          floatingLabelStyle: AppThemes.textThemeContext.bodyMedium!.copyWith(
            fontWeight: FontWeight.w600,

            color: AppColors.primaryColor,
          ),
          suffixIcon: isPasswordTextField == false
              ? null
              : IconButton(
                  onPressed: () => onSuffixTapped!(),
                  splashColor: Colors.transparent,
                  icon: Icon(
                    isVisible ? Icons.visibility_off : Icons.visibility,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: AppColors.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColors.borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: AppThemes.colorContext.error),
          ),
        ),
        keyboardType: keyBoardType,
        inputFormatters: inputFormatters,
        textCapitalization: textCapitalization,
        validator: onValidate,
        onChanged: onChanged,
        onTap: onTap,
        onFieldSubmitted: onFiledSubmittedValue,

        onTapOutside:
            onTapOutside ??
            (closeKeyboardOnTapOutSide
                ? (event) {
                    if (FocusScope.of(context).hasPrimaryFocus) {
                      FocusScope.of(context).unfocus();
                    }
                  }
                : null),
      ),
    );
  }
}
