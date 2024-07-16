
class CoordenadaResponse {
  final double lat;
  final double lng;

  const CoordenadaResponse({
    required this.lat,
    required this.lng
  });

   factory CoordenadaResponse.fromJson(Map<String, dynamic> json) {
    return CoordenadaResponse(
      lat: json['lat'] ,
      lng: json['lng'],
    );
  }
}