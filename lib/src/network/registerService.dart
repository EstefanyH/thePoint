import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:thepointapp/src/models/request/fileRequest.dart';
import 'package:thepointapp/src/network/iNetwork/iRegisterService.dart';
import 'package:thepointapp/src/util/apiService.dart';
import 'package:http/http.dart' as http;


class RegisterService extends IRegisterService with ChangeNotifier{
  RegisterService() : super();
  
  @override
  Future<dynamic> postFile(String filePath) async {
    // TODO: implement postFile
    try {
      final request = http.MultipartRequest('POST',Uri.parse(API_POST_FILE+"?bucketName=s3-hache-backup&prefix=img"));
      request.files.add(await http.MultipartFile.fromPath('file', filePath) );
      
      final response = await request.send();
      
      if (response.statusCode == 200) {
        return true;
      } else {
        print('File upload failed with status: ${response.statusCode}');
        return false;
      }
      throw Exception('Failed');
    } catch(er) {
      print('error getLocation -> ${er.toString()}');
      return false;
    }
    //return null;
  }
  
}