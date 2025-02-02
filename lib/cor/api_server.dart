import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServer {
  getRequest(String url) async {
    try {
      Uri uri = Uri.parse(url);
      http.Response response = await http.get(uri);

      if (response.statusCode == 200) {
        String dataJson = response.body;
        if (response.body.startsWith('{') || response.body.startsWith('[')) {

          print ('response start with {');
          Map<String, dynamic> dartData = jsonDecode(dataJson);
          return dartData;
        }
      } else {
        print('========== Error response code  >>  ${response.statusCode} ');
      }
    } catch (e) {
      print('================= Error catch >>  $e ');
    }
  }

  Future<Map<String, dynamic>> postRequest(
      String url, Map<String, dynamic> bodymab) async {
    try {
      Uri uri = Uri.parse(url);

      http.Response response = await http.post(uri, body: bodymab);
      if (response.statusCode == 200) {
        String dataJson = response.body;
        Map<String, dynamic> dartData = jsonDecode(dataJson);
        return dartData;
      } else {
        print('Error   reesponse is >>  ${response.statusCode} ');
        return {};
      }
    } catch (e) {
      print('Error catchzz >>  $e ');
      return {};
    }
  }
}
