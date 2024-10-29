import 'package:flutter/material.dart';

class DosageButton extends StatelessWidget {
  final Function()? onChanged;
  final String iconChangeTo;

  const DosageButton({super.key, this.onChanged, required this.iconChangeTo});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: iconChangeTo == 'beforeFood'
          ? const Icon(Icons.circle_outlined)
          : const Icon(Icons.circle),
      color: iconChangeTo == "na" ? Colors.grey : Colors.black,
      onPressed: onChanged,
    );
  }
}
