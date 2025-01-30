import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';

class NotsViewBody extends StatelessWidget {
  const NotsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: ListView(padding: EdgeInsets.all(12), children: [
        Column(
          spacing: 50,
          children: [
            CustomTextFormFild(hintText: 'UserName'),
            CustomTextFormFild(hintText: 'email'),
            CustomTextFormFild(hintText: 'Password'),
            SizedBox(height: 20,),
            MaterialButton(onPressed: (){},child: Text(''),)
          ],
        )
      ]),
    );
  }
}
