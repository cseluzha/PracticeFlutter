import 'package:shared_preferences/shared_preferences.dart';
import 'key_value_storage_services.dart';

class KeyValueStorageServicesImpl extends KeyValueStorageService {
  Future<SharedPreferences> getSharedPreference() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final prefs = await getSharedPreference();

    final typeHandlers = <Type, Function>{
      String: (String key) => prefs.getString(key),
      int: (String key) => prefs.getInt(key),
      double: (String key) => prefs.getDouble(key),
      bool: (String key) => prefs.getBool(key),
      List<String>: (String key) => prefs.getStringList(key),
    };

    final handler = typeHandlers[T];
    if (handler != null) {
      return handler(key) as T?;
    } else {
      throw UnimplementedError(
          'Get not implemented for type  ${T.runtimeType}');
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final prefs = await getSharedPreference();
    return prefs.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final prefs = await getSharedPreference();

    final typeHandlers = <Type, Function>{
      String: (String key, String value) => prefs.setString(key, value),
      int: (String key, int value) => prefs.setInt(key, value),
      double: (String key, double value) => prefs.setDouble(key, value),
      bool: (String key, bool value) => prefs.setBool(key, value),
      List<String>: (String key, List<String> value) =>
          prefs.setStringList(key, value),
    };

    final handler = typeHandlers[T];
    if (handler != null) {
      handler(key, value);
    } else {
      throw UnimplementedError('Set not implemented for type ${T.runtimeType}');
    }
  }
  
}
