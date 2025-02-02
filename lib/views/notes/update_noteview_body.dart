import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
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
    

    Map<String, dynamic> response =
        await ApiServer().postRequest(kurlAddNote_PostRequest, {
      Kresponse.knoteTitle: _titlecontroller.text,
      Kresponse.knoteSubtitle: _subtitlecontroller.text,
      Kresponse.knotuser_id: '66'
    });
    if (response['Status'] == 'Success') {
      CustomSnackBar.successSnackBar(context,
          ' User name  = ${response[Kresponse.kuserData][Kresponse.kuserName]}');

      // Map<String,dynamic> hivedata = response[Kresponse.kuserData];
 
     
      

      Navigator.pushReplacementNamed(context,kNotesview);
    } else {
      CustomSnackBar.faillureSnackBar(context,
          'statusvv =  ${response[Kresponse.kstatus]} >> and countvv = ${response['Row Coun']}');
    }
  }
}
