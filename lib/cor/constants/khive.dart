import 'package:hive/hive.dart';

const String khiveNotesInfo = 'notesInfo';
const String khiveUserInfo = 'userInfo';
Box khiveBox = Hive.box<Map<dynamic, dynamic>>(kBoxName);
const String kBoxName = 'boxname';

Map<String, dynamic> getHiveuserinfo() {
  var rowData = Hive.box(kBoxName).get(khiveUserInfo);
  Map<String, dynamic> _hiveBox = {};
  if (rowData != null && rowData is Map) {
    _hiveBox = rowData as Map<String, dynamic>;
  }

  return _hiveBox;
}
