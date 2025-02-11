import 'dart:io';

import 'package:dartz/dartz.dart' hide State;
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as p;
import 'package:php_notes_app/cor/api_server.dart';
import 'package:php_notes_app/cor/componants/custom_material_button.dart';
import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
import 'package:php_notes_app/cor/componants/custom_text_form_fild.dart';
import 'package:php_notes_app/cor/constants/kapi_services.dart';
import 'package:php_notes_app/cor/constants/kassets.dart';
import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/cor/constants/kroutes.dart';
import 'package:php_notes_app/cor/constants/kstyles.dart';

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({super.key});

  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _subtitlecontroller = TextEditingController();
  final TextEditingController _imageNameController = TextEditingController();

  File? file;
  ImagePicker imagePicker = ImagePicker();
  Color color = Colors.blue;
  @override
  Widget build(BuildContext context) {
    _imageNameController.text = p.basename(file?.path ?? 'يجب رفع صوره');

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Form(
        key: _globalKey,
        child: ListView(padding: EdgeInsets.all(12), children: [
          Column(
            spacing: 50,
            children: [
              CustomTextFormFild(
                hintText: 'title ',
                textEditingController: _titlecontroller,
              ),
              CustomTextFormFild(
                hintText: 'subtitle ',
                textEditingController: _subtitlecontroller,
              ),
              CustomTextFormFild(
                hintText: 'image name ',
                textEditingController: _imageNameController,
              ),
              CustomMaterilButton(
                color: color,
                'chose image ',
                onPressed: () async {
                  FocusManager.instance.primaryFocus?.unfocus();

                  await excuteShowbuttomSheet(context);
                  setState(() {});
                },
              ),
              CustomMaterilButton(
                'Save',
                onPressed: () async {
                  if (_globalKey.currentState!.validate()) {
                    file == null ? await addnote() : await addnoteWithImage();
                  }
                },
              ),
            ],
          )
        ]),
      ),
    );
  }

  Future<dynamic> excuteShowbuttomSheet(BuildContext context) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () async {
                      XFile? b = await imagePicker.pickImage(
                          source: ImageSource.gallery);
                      if (b == null) {
                        // showDialog(context: context, builder: (context) => AlertDialog(content: Text('يجب رفع صوره'),title: Text('error '),));

                        return;
                      }
                      file = File(b!.path);
                      color = Colors.green;
                      _imageNameController.text = p.basename(file!.path);

                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'chose from gallary ',
                        style: Kstyles.kTextStyle(30),
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                    onTap: () async {
                      print('on tap chose from camera ');
                      XFile? b = await imagePicker.pickImage(
                          source: ImageSource.camera);
                      file = File(b!.path);
                      color = Colors.green;
                      _imageNameController.text = p.basename(file!.path);
                      Navigator.pop(context);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'open camera ',
                        style: Kstyles.kTextStyle(30),
                        textAlign: TextAlign.center,
                      ),
                    )),
              ],
            ),
          );
        });
  }

  Future<void> addnote() async {
    if (file == null) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('يجب رفع صوره'),
              title: Text('error '),
            );
          });
      return;
    }
    Map<String, String> body = {
      Kresponse.knoteTitle: _titlecontroller.text,
      'notes_subtitle': _subtitlecontroller.text,
      Kresponse.kuserid: "${Hive.box(kBoxName).get(khiveUserInfo)['id']}",
    };

    Either<String, Map<String, dynamic>> response =
        await ApiServer().postRequest(kurlAddNote_PostRequest, body);
    response.fold((left) {
      CustomSnackBar.faillureSnackBar(context, left);
    }, (right) {
      if (right[Kresponse.kstatus] == Kresponse.kstatusSucces) {
        Navigator.pushReplacementNamed(context, kNotesview);
      } else {
        CustomSnackBar.faillureSnackBar(context, right[Kresponse.kstatus]);
      }
    });
  }

  Future<void> addnoteWithImage() async {
    Map<String, String> body = {
      Kresponse.knoteTitle: _titlecontroller.text,
      'notes_subtitle': _subtitlecontroller.text,
      Kresponse.kuserid: "${Hive.box(kBoxName).get(khiveUserInfo)['id']}",
    };

    Either<String, Map<String, dynamic>> response = await ApiServer()
        .multiPartRequest(
            uri: kurlAddNote_PostRequest,
            data: body,
            file: file!,
            nameFiledFile: 'imagefile');
    response.fold((left) {
      CustomSnackBar.faillureSnackBar(context, left);
    }, (right) {
      if (right[Kresponse.kstatus] == 'Success add note') {
        Navigator.pushReplacementNamed(context, kNotesview);
      } else {
        CustomSnackBar.faillureSnackBar(context, right[Kresponse.kstatus]);
      }
    });
  }
}
