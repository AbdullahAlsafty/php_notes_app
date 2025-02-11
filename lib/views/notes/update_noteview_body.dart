import 'dart:io';

import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
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
    File? file;

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
              hintText: data['notes_title'],
              textEditingController: _titlecontroller,
            ),
            CustomTextFormFild(
              hintText: data[Kresponse.knoteSubtitle],
              textEditingController: _subtitlecontroller,
            ),
            CustomMaterilButton(
              'chose image ',
              onPressed: () async {
                ImagePicker imagePicker = ImagePicker();

                XFile? b =
                    await imagePicker.pickImage(source: ImageSource.gallery);
                if (b == null) {
                  CustomSnackBar.faillureSnackBar(context, 'no image Selected');
                  return;
                }
                file = File(b.path);
              },
            ),
            CustomMaterilButton(
              'Save',
              onPressed: () async {
                if (_globalKey.currentState!.validate()) {
                  await updatenot(data['id'].toString(), file, data);
                }
              },
            ),
          ],
        )
      ]),
    );
  }

  Future<void> updatenot(String id, File? file, data) async {

    String kk = 'http://192.168.1.11/authontication/notes/tt.php/';
    Either<String, Map<String, dynamic>> response;
    Map<String, String> body = {
      Kresponse.knoteTitle: _titlecontroller.text,
      Kresponse.knoteSubtitle: _subtitlecontroller.text,
      'note_id': id,
      'oldImageName': '${data['notes_image']}',
    };
    if (file == null) {
      print('==========2222222==============');

      response = await ApiServer().postRequest('http://192.168.1.11/authontication/notes/tt.php/', body);
    } else {
      print('==========3333333==============');

      response = await ApiServer().multiPartRequest(
        uri: kk,
        data: body,
        file: file,
        nameFiledFile: 'newImageFile',
      );
    }

    response.fold((left) {
      CustomSnackBar.faillureSnackBar(context, left);
    }, (right) {
      if (right[Kresponse.kstatus] == 'Success') {
        Navigator.pushReplacementNamed(context, kNotesview);
      } else {
        CustomSnackBar.faillureSnackBar(
            context, right[Kresponse.kstatusFailure]);
      }
    });
  }
}
