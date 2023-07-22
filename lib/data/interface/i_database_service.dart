/// Istekleri yapacak olan servisin soyut sınıfı
abstract class IDatabaseService {
  /// servisi başlatacak olan fonksiyon
  Future<void> init();

  /// verileri getirecek olan fonksiyon
  Future<dynamic> getData(String endPoint);
}
