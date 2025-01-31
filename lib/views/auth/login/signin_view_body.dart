import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';
import 'package:php_notes_app/cor/constants/kBox_hive.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
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

               
              },
            ),
       
          ],
        )
      ]),
    );
  }

  Future<void> signin () async {
    Map<String, dynamic> response = await ApiServer().postRequest(kurlSignin_PostRequest, {
      'email': _emaiController.text,
      'password': _passwordController.text,
    });
    if (response['Status'] == 'Success') {
        print(' Hive values befor singn in >>>>>  ${Hive.box(kBoxName).values}');
            CustomSnackBar.successSnackBar(context, 'statusvv =  ${response['Status']} >> and countvv = ${response['Row Coun']}');
await  Hive.box(kBoxName).clear();
    Map<String ,dynamic> hivedata = {'all user data':response[Kresponse.kuserData]};
     await Hive.box(kBoxName).putAll(hivedata);
           print(' Hive values after singn in >>>>>  ${Hive.box(kBoxName).values}');
      Navigator.pushNamed( context, kNotesview,);
    }else{
      CustomSnackBar.faillureSnackBar(context, 'statusvv =  ${response[Kresponse.kstatus]} >> and countvv = ${response['Row Coun']}');
    }
  }
}


