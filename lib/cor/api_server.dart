import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiServer {
  Future<void> getRequest(String url) async {
    try {
      http.Response response = await http.get(Uri.parse(url));
      String dataJson = response.body;
      Map<String, dynamic> dartData = jsonDecode(dataJson);
      if (response.statusCode == 200) {
        print(dartData['Status']);
      } else {
        print(dartData['Status']);
      }
    } catch (e) {
      print('Error catch >>  $e ');
    }
  }

  Future<void> postRequest(String url, Map<String, dynamic> bodymab) async {
    try {
      http.Response response = await http.post(Uri.parse(url), body: bodymab);
      String dataJson = response.body;
      Map<String, dynamic> dartData = jsonDecode(dataJson);
      if (response.statusCode == 200) {
        print(dartData['Status']);
      } else {
        print(dartData['Status']);
      }
    } catch (e) {
      print('Error catch >>  $e ');
    }
  }
}
