import 'package:php_notes_app/cor/constants/khive.dart';
import 'package:php_notes_app/cor/constants/kresponse.dart';

class UserModel {
  final String userId;
  const UserModel(this.userId);
  factory UserModel.fromHive(var hiveUserdata) {
    return UserModel("${hiveUserdata['id']}");
  }

  factory UserModel.fromJson(var jsonData) {
    return UserModel(jsonData[Kresponse.kuserData]['id']);
  }
}
