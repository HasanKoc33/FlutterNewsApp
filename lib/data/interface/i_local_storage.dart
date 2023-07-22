/// Lokal depolama için arayüz
abstract class ILocalStorage {
  /// initilaze metgotu
  Future<void> init();

  /// lokal depoya kaydet
  Future<void> save(String key, String value);

  /// lokal depodan oku
  Future<String> read(String key);

  /// lokal depodan sil
  Future<void> delete(String key);

  /// dinleyici methotu
}
