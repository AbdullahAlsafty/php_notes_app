import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as p;

class ApiServer {
  

///// post Request
  Future<Either<String, Map<String, dynamic>>> postRequest(
      String url, Map<String, dynamic> bodymab) async {

    try {
      Uri uri = Uri.parse(url);

      http.Response response = await http.post(uri, body: bodymab).timeout(
        Duration(seconds: 10),
        onTimeout: () {
          return http.Response(" ======= Error Timed out ====  ", 6999999666);
        },
      );

      log(
          " =============response body post request=${response.body}==============");
    

      if (response.statusCode == 200) {
        String dataJson = response.body;

        try {
          Map<String, dynamic> dartData = jsonDecode(dataJson);

          return right(dartData);
        } catch (e) {
          return left('response not  json formated >> $e');
        }
      } else {
        return left('status code = ${response.statusCode}');
      }
    }  on SocketException catch(e){
      return left('error catch post requist >> $e ');
    }on TimeoutException catch(e){
      return left('error catch post requist >> $e ');
    }  catch (e) {
      return left('catch error e >>. $e');
    }
  
  }

///// Multi post Request

  Future<Either<String, Map<String, dynamic>>> multiPartRequest(
      {required String uri,
      required File file,
      required String nameFiledFile,
      required Map<String, String> data}) async {
    try {
      if (await file.exists()) {
        Stream<List<int>> b = file.openRead();
        http.MultipartFile multipartFile = http.MultipartFile(
            nameFiledFile, b, await file.length(),
            filename: p.basename(file.path));
        var requist = await http.MultipartRequest('POST', Uri.parse(uri));
        requist.files.add(multipartFile);
        requist.fields.addAll(data);
        http.StreamedResponse streamresponse = await requist.send().timeout(Duration(seconds: 10),onTimeout: (){return http.StreamedResponse(b, 6999999666); } );
        http.Response response = await http.Response.fromStream(streamresponse);
       
        if (response.statusCode == 200) {
          try {
            Map<String, dynamic> dartData = jsonDecode(response.body);
            return right(dartData);
          } catch (e) {
            return left(" Formated json Exeption ");
          }
        } else {
          return left("error status code = ${response.statusCode}");
        }
      } else {
        return left("مشكلة في جلب المفات ربما يكون غير موجود");
      }
    } on SocketException catch(e){
      return left('error catch multi post requist >> $e ');
    }on TimeoutException catch(e){
      return left('error catch multi post requist >> $e ');
    } 
    
    
    
    catch (e) {
      return left("error catch multi post requist >> $e ");
    }
  }
}
