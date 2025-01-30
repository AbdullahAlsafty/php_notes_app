import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
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
                  var vv = _globalKey.currentState!.save();

                  await ApiServer().postRequest(
                      'http://192.168.0.103/authontication/auth/signUp.php/', {
                    'email': _emaiController.text,
                    'userName': _usernameController.text,
                    'password': _passwordController.text
                  });
                }
              },
            ),
            InkWell(
              onTap: () {
                //Navigator.of(context).pushReplacementNamed(kSignin);
              },
              child: Text(
                'Sign in >>',
                style: Kstyles.kTextStyle(
                    22, const Color.fromARGB(255, 136, 182, 220)),
              ),
            )
          ],
        )
      ]),
    );
  }
}
