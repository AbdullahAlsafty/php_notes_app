import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiServer {
  // getRequest(String url) async {
  //   try {
  //     Uri uri = Uri.parse(url);
  //     http.Response response = await http.get(uri);

  //     if (response.statusCode == 200) {
  //       String dataJson = response.body;
  //       if (response.body.startsWith('{') || response.body.startsWith('[')) {
  //         print('response start with {');
  //         Map<String, dynamic> dartData = jsonDecode(dataJson);
  //         return dartData;
  //       }
  //     } else {
  //       print('========== Error response code  >>  ${response.statusCode} ');
  //     }
  //   } catch (e) {
  //     print('================= Error catch >>  $e ');
  //   }
  // }

  Future<Either<String, Map<String, dynamic>>> postRequest(
      String url, Map<String, dynamic> bodymab) async {
    try {
      Uri uri = Uri.parse(url);

      http.Response response = await http.post(uri, body: bodymab).timeout(
        Duration(seconds: 5),
        onTimeout: () {
          return http.Response(" ======= Error Timed out ====  ", 6999999666);
        },
      );
      print('=========status code = > "${response.statusCode}" =============');
      print(response.body);

      print('======================');

      if (response.statusCode == null) {
        return left('status code = null ');
      } else if (response.statusCode == 200) {
        String dataJson = response.body;

        if (response.body.startsWith('{') || response.body.startsWith('[')) {
          Map<String, dynamic> dartData = jsonDecode(dataJson);

          return right(dartData);
        } else {
          return left('response not dart formated >> ${response.statusCode}');
        }
      } else {
        return left('status code = ${response.statusCode}');
      }
    } catch (e) {
      return left('catch error e >>. $e');
    }
  }
}
