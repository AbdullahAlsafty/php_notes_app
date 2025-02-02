import 'package:hive/hive.dart';
import 'package:php_notes_app/cor/constants/khive.dart';



abstract class EditHive{
  
  static Future<void> addhiveUserInfo( Map<String, dynamic> hiveUserInfo) async {
    await Hive.box(kBoxName).delete('userInfo');
    
          await Hive.box(kBoxName).put('userInfo', hiveUserInfo);
  }


   static Future<void> clearUserinfo() async {
    await Hive.box(kBoxName).delete('userInfo');
    
  }
 static Future<void> addHiveNotesInfo(Map<String, dynamic> hiveNotesInfo) async {
          await Hive.box(kBoxName).put('notesInfo', hiveNotesInfo);
    
  }
   static Future<void> clearNotesinfo() async {
    await Hive.box(kBoxName).delete('notesInfo');
    
  }

  
}