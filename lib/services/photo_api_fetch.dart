import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:photo_gallery_with_api/utils/api_url.dart';

class PhotoApiFetch {
  Future<List<dynamic>> fetchPhotoInfo() async {
    List<dynamic> jsonData = [];
    final http.Response response = await http.get(Uri.parse(photoApiUrl));
    if(response.statusCode == 200){
      jsonData = jsonDecode(response.body);
    }else{
      throw Exception('Failed to load photos');
    }
    return jsonData;
  }
}
