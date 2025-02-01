import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';

class CustomMaterilButton extends StatelessWidget {
  const CustomMaterilButton(this.label, {super.key, required this.onPressed});
  final String label;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blue,
      onPressed: onPressed,
      child: Text(
        label,
        style: Kstyles.kTextStyle(22, Colors.white),
      ),
    );
  }
}
