import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';

class UpdateNoteviewBody extends StatefulWidget {
  const UpdateNoteviewBody({super.key});

  @override
  State<UpdateNoteviewBody> createState() => _UpdateNoteviewBodyState();
}

class _UpdateNoteviewBodyState extends State<UpdateNoteviewBody> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _subtitlecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
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
              hintText: data['title'],
              textEditingController: _titlecontroller,
            ),
            CustomTextFormFild(
              hintText: data[Kresponse.knoteSubtitle],
              textEditingController: _subtitlecontroller,
            ),
            CustomMaterilButton(
              'Save',
              onPressed: () async {
                if (_globalKey.currentState!.validate()) {
                  await updatenot(data['id']);
                }
              },
            ),
          ],
        )
      ]),
    );
  }

  Future<void> updatenot(String id) async {
    Either<String, Map<String, dynamic>> response =
        await ApiServer().postRequest(kurlupdatNote_PostRequest, {
      Kresponse.knoteTitle: _titlecontroller.text,
      Kresponse.knoteSubtitle: _subtitlecontroller.text,
      Kresponse.knoteid: id,
    });

    response.fold((left) {
      CustomSnackBar.faillureSnackBar(context, left);
    }, (right) {
      if (right[Kresponse.kstatus] == Kresponse.kstatusSucces) {
        Navigator.pushReplacementNamed(context, kNotesview);
      } else {
        CustomSnackBar.faillureSnackBar(
            context, right[Kresponse.kstatusFailure]);
      }
    });

  
  }
}
