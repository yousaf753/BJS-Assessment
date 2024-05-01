import 'package:get_storage/get_storage.dart';

class LocalRequest {
  static String userInfoKey = "user_info_key";
  final GetStorage getStorage = GetStorage();

  //region Singleton implementation
  LocalRequest._internal();

  static final LocalRequest _localRequest = LocalRequest._internal();

  factory LocalRequest() => _localRequest;

  static LocalRequest get instance => _localRequest;

  //endregion

  String getString({required String key}) {
    String value = '';
    try {
      if (getStorage.read(key) is String?) {
        value = getStorage.read(key) ?? '';
      }
    } catch (exception) {
      value = '';
    }
    return value;
  }

  Future setString({required String key, required String value}) async =>
      await getStorage.write(key, value);
}
