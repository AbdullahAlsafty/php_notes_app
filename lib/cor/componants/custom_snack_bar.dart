import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';

abstract class CustomSnackBar {
  static successSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
      content,
      style: Kstyles.kTextStyle(18),
    )));
  }

  static faillureSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        content,
        style: Kstyles.kTextStyle(18),
      ),
      backgroundColor: Colors.red,
    ));
  }
}
