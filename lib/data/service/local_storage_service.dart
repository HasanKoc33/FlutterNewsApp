// ignore: depend_on_referenced_packages
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/core/constant/app_strings.dart';
import 'package:news_app/core/constant/hive_key.dart';
import 'package:news_app/data/interface/i_local_storage.dart';

/// Hive ile local storage işlemlerini yapan sınıf
class LocalStorageService implements ILocalStorage {
  @override
  Future<void> delete(String key) async {
    // ignore: inference_failure_on_function_invocation
    await Hive.box(HiveKey.settings.name).delete(key);
  }

  @override
  Future<String> read(String key) async {
    // ignore: inference_failure_on_function_invocation
    return await Hive.box(HiveKey.settings.name).get(
      key,
      defaultValue: AppStrings.system.name,
    ) as String;
  }

  @override
  Future<void> save(String key, String value) async {
    // ignore: inference_failure_on_function_invocation
    await Hive.box(HiveKey.settings.name).put(key, value);
  }

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    // ignore: inference_failure_on_function_invocation
    await Hive.openBox(HiveKey.settings.name);
  }
}
