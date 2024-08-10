import 'package:thepointapp/src/util/constant.dart';

String SERVER_API_URL = 'https://bfqtkvlfl8.execute-api.us-west-2.amazonaws.com/V1/';
String API_LOGIN = '${SERVER_API_URL}loginemployee';


String API_GOOGLE_PLACE = 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=%s&key=$GOOGLE_MAP_API_KEY&sessiontoken=%s';
//String request = '$API_GOOGLE_PLACE?input=$input&key=$GOOGLE_MAP_API_KEY&sessiontoken=$token';
String API_GOOGLE_GEOCODING = 'https://maps.googleapis.com/maps/api/geocode/json?place_id=%s&key=$GOOGLE_MAP_API_KEY';

String API_POST_FILE = '${SERVER_API_URL}Files';

String ContentType = 'application/json';