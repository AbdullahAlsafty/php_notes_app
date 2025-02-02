import 'package:hive/hive.dart';
import 'package:php_notes_app/cor/constants/khive.dart';



abstract class EditHive{
  
  static Future<void> addhiveUserInfo( Map<String, dynamic> hiveUserInfo) async {
    await Hive.box(kBoxName).delete(khiveUserInfo);
    
          await Hive.box(kBoxName).put(khiveUserInfo, hiveUserInfo);
  }


   static Future<void> clearUserinfo() async {
    await Hive.box(kBoxName).delete('userInfo');
    
  }
 static Future<void> addHiveNotesInfo(Map<String, dynamic> hiveNotesInfo) async {
      await Hive.box(kBoxName).delete(khiveNotesInfo);

          await Hive.box(kBoxName).put(khiveNotesInfo, hiveNotesInfo);
    
  }
   static Future<void> clearNotesinfo() async {
    await Hive.box(kBoxName).delete(khiveNotesInfo);
    
  }

  
}