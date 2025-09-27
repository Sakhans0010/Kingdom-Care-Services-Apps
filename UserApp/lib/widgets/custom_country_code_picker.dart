import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:kingdom_care_services_app/constants/constants.dart';

class CustomCountryCodePicker extends StatelessWidget {
  const CustomCountryCodePicker({
    super.key,
    required this.onChanged,
    required this.initialSelection,
    required this.favorite,
  });

  final void Function(CountryCode) onChanged;
  final String? initialSelection;
  final List<String> favorite;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(14),
        color: AppColors.secondaryBackground,
      ),
      child: CountryCodePicker(
        onChanged: onChanged,
        initialSelection: initialSelection, // UK as default
        favorite: favorite,
        padding: EdgeInsetsGeometry.symmetric(vertical: 8),
        showCountryOnly: false, // Show country name with flag
        showOnlyCountryWhenClosed: false,
        alignLeft: false,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        comparator: (a, b) => b.name!.compareTo(a.name!),

        flagDecoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
      ),
    );
  }
}
