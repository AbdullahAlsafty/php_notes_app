import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/functions/edit_hive.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _emaiController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        autovalidateMode = AutovalidateMode.always;
        setState(() {});
      },
      autovalidateMode: autovalidateMode,
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
              onPressed: () async {
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

  Future<void> signin() async {
    Either<String, Map<String, dynamic>> response =
        await ApiServer().postRequest(kurlSignin_PostRequest, {
      'email': _emaiController.text,
      'password': _passwordController.text,
    });

    response.fold((left) {
      CustomSnackBar.faillureSnackBar(context, left);
    }, (right) {
      if (right[Kresponse.kstatus] == Kresponse.kstatusSucces) {
        Map<String, dynamic> hiveUserInfo = right[Kresponse.kuserData];
        Hive.box(kBoxName).put(khiveUserInfo, hiveUserInfo);

        Navigator.pushReplacementNamed(context, kNotesview);
        Navigator.pushNamed(
          context,
          kNotesview,
        );
      } else if (right[Kresponse.kstatus] == Kresponse.kstatusFailure) {
        

         CustomSnackBar.faillureSnackBar(context, 'خطا بالايميل او الباسوورد');
      } else {
        CustomSnackBar.faillureSnackBar(context, 'ERRRRRRRRRRR',
            color: Colors.yellow);
      }
    });

//     if (response[Kresponse.kstatus] == Kresponse.kstatusSucces) {
//       CustomSnackBar.successSnackBar(context,
//           ' User name  = ${response[Kresponse.kuserData][Kresponse.kuserName]}');

//       Map<String, dynamic> hiveUserInfo = response[Kresponse.kuserData];
//      Hive.box(kBoxName).put(khiveUserInfo,
//                   hiveUserInfo   );

// Navigator.pushReplacementNamed(context, kNotesview);
//       Navigator.pushNamed(
//         context,
//         kNotesview,
//       );
//     } else if (response[Kresponse.kstatus] == Kresponse.kstatusFailure){
//  CustomSnackBar.faillureSnackBar(context,
//           'خطا بالايميل او الباسوورد');

//     }
//     else if (response[Kresponse.kstatus]==null ){
//  CustomSnackBar.faillureSnackBar(context,
//           '  الخطا المنتظر بسبب الريسبونس غريب انظر الى الكونسول' ,color: Colors.green);
//           print ("******************status = null");
//           print ("==response ===${response}");

//           print ("******************2");

//     }

//     else {
//       CustomSnackBar.faillureSnackBar(context,
//           '  لا يوجد ريسبونس نهائي انظر الى الكونسول ' ,color:  Colors.yellow);

//            print ("******************response  = null");
//           print ("==response ===${response}");

//           print ("******************2");
//     }
  }
}
