
abstract class IMapService {
  Future<dynamic> searchAdress(String ruta, String token);
  Future<dynamic> getLocation(String address);
}