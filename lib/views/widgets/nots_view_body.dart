import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';

class NotsViewBody extends StatelessWidget {
  const NotsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
    
    
      child: ListView(
        children:[
          CustomTextFormFild(hintText: 'UserName'),
        
          CustomTextFormFild(hintText: 'email'),
          CustomTextFormFild(hintText: 'Password'),
          
        ]
      ),
    );
  }
}
