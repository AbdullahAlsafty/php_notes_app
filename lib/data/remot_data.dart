// import 'package:dartz/dartz.dart';
// import 'package:flutter/material.dart';
// import 'package:php_notes_app/cor/api_server.dart';
// import 'package:php_notes_app/cor/componants/custom_snack_bar.dart';
// import 'package:php_notes_app/cor/constants/kapi_services.dart';
// import 'package:php_notes_app/cor/constants/kresponse.dart';
// import 'package:php_notes_app/cor/constants/kroutes.dart';

// abstract class RemotData{

//  Future<void> updatenot(BuildContext context ,String title,String subtitle ,String notid) async {

//     Map<String, dynamic> response =
//         await ApiServer().postRequest(kurlupdatNote_PostRequest, {
//       Kresponse.knoteTitle: title ,
//       Kresponse.knoteSubtitle: subtitle,
//       Kresponse.knoteid: notid,

//     });
//     print ('===================');
//     print (response);
//         print ('===================');

//     if (response['Status'] == 'Success') {
//       CustomSnackBar.successSnackBar(context,
//           ' User name  = ${response[Kresponse.kuserData][Kresponse.kuserName]}');

//       // Map<String,dynamic> hivedata = response[Kresponse.kuserData];

//       Navigator.pushReplacementNamed(context,kNotesview);
//     } else {
//       CustomSnackBar.faillureSnackBar(context,
//           'statusvv =  ${response[Kresponse.kstatus]} >> and countvv = ${response['Row Coun']}');
//     }
//   }

// }
