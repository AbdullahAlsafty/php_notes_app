import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';
import 'package:php_notes_app/views/notes/notes_view.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

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
              hintText: 'email',
              textEditingController: _emaiController,
            ),
            CustomTextFormFild(
              hintText: 'Password',
              textEditingController: _passwordController,
            ),
            CustomMaterilButton(
              'Sign in',
              onPressed: ()async {
                if (_globalKey.currentState!.validate()) {

                  await signin();
                }

                // Navigator.pushReplacementNamed(context, kNotesview);
              },
            ),
            InkWell(
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) {
                //       return NotesView();
                //     },
                //   ),
                // );
                Navigator.pushNamed(context, kSignupView);
              },
              child: Text(
                'Sign up >>',
                style: Kstyles.kTextStyle(
                    22, const Color.fromARGB(255, 136, 182, 220)),
              ),
            )
          ],
        )
      ]),
    );
  }

  Future<void> signin () async {
    Map<String, dynamic> response = await ApiServer().postRequest(kSignin_urlPost, {
      'email': _emaiController.text,
      'password': _passwordController.text,
    });
    if (response['Status'] == 'Success') {
            CustomSnackBar.successSnackBar(context, 'statusvv =  ${response['Status']} >> and countvv = ${response['Row Coun']}');

      Navigator.pushNamedAndRemoveUntil( context, kNotesview, (context) => true);
    }else{
      CustomSnackBar.faillureSnackBar(context, 'statusvv =  ${response['Status']} >> and countvv = ${response['Row Coun']}');
    }
  }
}
