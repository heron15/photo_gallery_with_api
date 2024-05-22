import 'package:photo_gallery_with_api/model/photo_model.dart';
import 'package:photo_gallery_with_api/services/photo_api_fetch.dart';

class PhotoDataController {
  PhotoApiFetch photoApiFetch;
  bool isError = false;

  PhotoDataController(this.photoApiFetch);

  Future<List<PhotoModel>> loadPhotoInfo() async {
    List<PhotoModel> photoModelList = [];
    List<dynamic> jsonData = [];

    try {
      jsonData = await photoApiFetch.fetchPhotoInfo();
      for (Map<String, dynamic> json in jsonData) {
        photoModelList.add(PhotoModel.fromJson(json));
      }
    } catch (statusCode) {
      isError = true;
      rethrow;
    }
    return photoModelList;
  }
}
