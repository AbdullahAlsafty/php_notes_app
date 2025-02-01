import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({
    super.key,
   
  });
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'congraturation',
          style: Kstyles.kTextStyle(30),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
           'success sign up ',
            style: Kstyles.kTextStyle(30),
          )),
          CustomMaterilButton('Go to sign in page .>', onPressed: () {
          Navigator.pushNamed(context, kSigninView);
          })
        ],
      ),
    );
  }
}
