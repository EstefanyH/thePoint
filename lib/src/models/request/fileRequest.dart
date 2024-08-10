
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class FilesRequest {
  final String bucketName;
  final String prefix;

  const FilesRequest({required this.bucketName, required this.prefix});

   Map<String, String> toJson() => {
    'bucketName': bucketName,
    'prefix': prefix
  };
}