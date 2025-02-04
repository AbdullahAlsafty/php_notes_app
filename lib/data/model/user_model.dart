import 'package:php_notes_app/cor/constants/kresponse.dart';
import 'package:php_notes_app/data/model/json_model.dart';
import 'package:php_notes_app/data/model/notes_model.dart';

class UserModel extends JsonModel {
  final String userId;
  const UserModel(this.userId);
  factory UserModel.fromHive(Map<String, dynamic> hiveUserdata) {
    return UserModel("${hiveUserdata['id']}");
  }

  factory UserModel.fromJson(Map<String, dynamic> jsonData) {
    return UserModel(jsonData[Kresponse.kuserData]['id']);
  }
}
