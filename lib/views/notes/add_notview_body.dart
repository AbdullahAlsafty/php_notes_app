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

class AddNoteViewBody extends StatefulWidget {
  const AddNoteViewBody({super.key});

  @override
  State<AddNoteViewBody> createState() => _AddNoteViewBodyState();
}

class _AddNoteViewBodyState extends State<AddNoteViewBody> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();
  final TextEditingController _titlecontroller = TextEditingController();
  final TextEditingController _subtitlecontroller = TextEditingController();
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
              hintText: 'title ttttttt',
              textEditingController: _titlecontroller,
            ),
            CustomTextFormFild(
              hintText: 'subtitle tttttt',
              textEditingController: _subtitlecontroller,
            ),
            CustomMaterilButton(
              'Save',
              onPressed: () async {
                if (_globalKey.currentState!.validate()) {
                  await addnote();
                }
              },
            ),
          ],
        )
      ]),
    );
  }

  Future<void> addnote() async {
    Either<String, Map<String, dynamic>> response =
        await ApiServer().postRequest(kurlAddNote_PostRequest, {
      Kresponse.knoteTitle: _titlecontroller.text,
      'notes_subtitle': _subtitlecontroller.text,
      Kresponse.kuserid: "${Hive.box(kBoxName).get(khiveUserInfo)['id']}"
    });
    response.fold((left) {
      CustomSnackBar.faillureSnackBar(context, left);
    }, (right) {
      if (right[Kresponse.kstatus] == Kresponse.kstatusSucces) {
        Navigator.pushReplacementNamed(context, kNotesview);
      } else {
        CustomSnackBar.faillureSnackBar(context, right[Kresponse.kstatus]);
      }
    });

    // if (response['Status'] == 'Success') {
    //   CustomSnackBar.successSnackBar(context, ' add don ');

    //   Map<String, dynamic> hivedata = response[Kresponse.kuserData];

    //   await Hive.box(kBoxName).put(khiveNotesInfo, hivedata);

    //  await EditHive.addHiveNotesInfo(hivedata);

    //   Navigator.pushReplacementNamed(context, kNotesview);
    // } else if (response[Kresponse.kstatus] == Kresponse.kstatusFailure) {
    //   CustomSnackBar.faillureSnackBar(context, 'خطا بالايميل او الباسوورد');
    // } else if (response[Kresponse.kstatus] == null) {
    //   CustomSnackBar.faillureSnackBar(
    //       context, '  الخطا المنتظر بسبب الريسبونس غريب انظر الى الكونسول',
    //       color: Colors.green);
    //   print("******************status = null");
    //   print("==response ===${response}");

    //   print("******************2");
    // } else {
    //   CustomSnackBar.faillureSnackBar(
    //       context, '  لا يوجد ريسبونس نهائي انظر الى الكونسول ',
    //       color: Colors.yellow);

    //   print("******************response  = null");
    //   print("==response ===${response}");

    //   print("******************2");
    // }
  }
}
