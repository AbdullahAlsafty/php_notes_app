import 'package:flutter/material.dart';

class CustomTextFormFild extends StatelessWidget {
  const CustomTextFormFild({
    super.key,
    required this.hintText,
    required this.textEditingController,
  });
  final String hintText;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return ' الحقل لا يجب ان يكون فارغا  ';
        } else if (value!.length < 2) {
          return ' الحقل يجب ان يكون اكثر من حرفين  ';
        } else if (value.length > 50) {
          return ' الحقل يجب ان يكون اقل من 50 حرف  ';
        }

        return null;
      },
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
