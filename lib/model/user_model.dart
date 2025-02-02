import 'package:php_notes_app/cor/constants/khive.dart';

class UserModel {
  final String userId ;
  const  UserModel(this.userId);
  factory UserModel.fromHive (var hiveUserdata){
    return UserModel(hiveUserdata[khiveUserInfo]['id']);

  }
}