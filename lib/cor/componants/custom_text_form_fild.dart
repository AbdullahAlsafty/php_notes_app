import 'package:flutter/material.dart';

class CustomTextFormFild extends StatelessWidget {
  const CustomTextFormFild({super.key, required this.hintText});
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
          
          decoration: InputDecoration(
            hintText: hintText,
            contentPadding: EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          border: OutlineInputBorder()
          ),
         
        );
  }
}