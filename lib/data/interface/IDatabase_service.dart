abstract class IDatabaseService {
  Future<void> init();
  Future<Map> getData(String endPoint);
}
