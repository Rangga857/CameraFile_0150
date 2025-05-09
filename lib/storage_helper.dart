import 'dart:io';

class StorageHelper {
  static Future<String> _getFolderPath() async{
    final Directory dir = 
    Directory('/storage/emulated/0/DCIM/FlutterNativeCam');
    if (!await dir.exists()) await dir.create(recursive: true);
    return dir.path;
  }
}