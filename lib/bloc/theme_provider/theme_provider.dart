import 'package:flutter/material.dart';
import 'package:news_app/core/constant/hive_key.dart';
import 'package:news_app/data/service/local_storage_service.dart';

/// tema degişikliği için kullanılan provider
class ThemeProvider extends ChangeNotifier {
  // ignore: public_member_api_docs
  LocalStorageService localStorageService = LocalStorageService();

  /// servisi başlatır
  Future<void> init() async {
    await localStorageService.init();
  }

  /// uygulamanın temasını değiştirir
  void changeTheme(String value) {
    localStorageService.save(HiveKey.theme.name, value);
    notifyListeners();
  }

  /// uygulamanın temasını döndürür
  Future<String> getTheme() async {
    // ignore: unnecessary_await_in_return
    return await localStorageService.read(HiveKey.theme.name);
  }
}
