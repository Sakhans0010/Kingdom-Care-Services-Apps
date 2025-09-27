import 'package:flutter/material.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    this.isSelected = false,
    required this.onChanged,
  });

  final bool isSelected;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: Checkbox(
        value: isSelected,
        onChanged: (value) => onChanged(value),
        activeColor: Theme.of(context).colorScheme.tertiary,
        checkColor: Theme.of(context).colorScheme.onPrimary,
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        side: BorderSide(
          width: 1.5,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      ),
    );
  }
}
