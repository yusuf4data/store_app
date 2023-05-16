abstract class Repository<T> {
  Future<List<T>> getAllData(String type);
}
