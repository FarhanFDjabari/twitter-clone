import 'package:get_storage/get_storage.dart';

class Cache {
  static Future<void> writeData({
    required String key,
    required dynamic value,
  }) async {
    final box = GetStorage();
    await box.write(key, value);
  }

  static Future<dynamic> getData(String key) async {
    final box = GetStorage();
    final result = await box.read(key);
    return result;
  }

  static Future<void> deleteData(String key) async {
    final box = GetStorage();
    await box.remove(key);
  }
}
