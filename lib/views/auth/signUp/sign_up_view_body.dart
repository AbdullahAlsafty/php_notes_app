import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/functions/edit_hive.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
 final  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _globalKey,
      child: ListView(padding: EdgeInsets.all(12), children: [
        Column(
          spacing: 50,
          children: [
            Image.asset(
              Kassets.kLogo,
              fit: BoxFit.fill,
            ),
            CustomTextFormFild(
              hintText: 'UserName',
              textEditingController: _usernameController,
            ),
            CustomTextFormFild(
              hintText: 'email',
              textEditingController: _emaiController,
            ),
            CustomTextFormFild(
              hintText: 'Password',
              textEditingController: _passwordController,
            ),
            CustomMaterilButton(
              'Sign Up',
              onPressed: () async {
                if (_globalKey.currentState!.validate()) {
                  await signUp();
                }
              },
            ),
         
          ],
        )
      ]),
    );
  }

  Future<void> signUp( ) async {
Either<String ,Map<String ,dynamic>>  response = await ApiServer()
        .postRequest(kurlSignUp_PostRequest, {
      'email': _emaiController.text,
      'userName': _usernameController.text,
      'password': _passwordController.text,
    });


response.fold((left){
  CustomSnackBar.faillureSnackBar(context, left);
}, (right){
  if (right[Kresponse.kstatus] == Kresponse.kstatusSucces) {

     Navigator.of(context).pushReplacementNamed(kSuccessView);
  }else{
    CustomSnackBar.faillureSnackBar(context, right[Kresponse.kstatus]);
  }
    

  
});

//     if (response[Kresponse.kstatus] == Kresponse.kstatusSucces) {
//     Map<String ,dynamic> hiveUserInfo =response[Kresponse.kuserData];
// EditHive.addhiveUserInfo(hiveUserInfo);
//      Navigator.of(context).pushReplacementNamed(kSuccessView);
//     }else{
   //  CustomSnackBar.faillureSnackBar(context, 'statusvv =  ${response[Kresponse.kstatus]} >> and countvv = ${response['Row Coun']}');
     
//     }
  }
}
