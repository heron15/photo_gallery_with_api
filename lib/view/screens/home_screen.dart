import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_gallery_with_api/controller/photo_data_controller.dart';
import 'package:photo_gallery_with_api/services/photo_api_fetch.dart';
import 'package:photo_gallery_with_api/utils/app_route.dart';
import 'package:photo_gallery_with_api/utils/custom_color.dart';
import 'package:photo_gallery_with_api/view/widgets/photo_list.dart';
import '../../model/photo_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PhotoModel> photoModel = [];
  late PhotoDataController photoDataController;
  late Future<void> _photoDataFuture;

  @override
  void initState() {
    super.initState();
    photoDataController = PhotoDataController(PhotoApiFetch());
    _photoDataFuture = _loadPhotos();
  }

  Future<void> _loadPhotos() async {
    try {
      List<PhotoModel> tempPhoto = await photoDataController.loadPhotoInfo();
      setState(() {
        photoModel = tempPhoto;
      });
    } catch (error) {
      print('Failed to load photos: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Photo Gallery App",
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<void>(
          future: _photoDataFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Failed to load photos."),
              );
            } else {
              return RefreshIndicator(
                onRefresh: _loadPhotos,
                child: photoModel.isEmpty && photoDataController.isError
                    ? const Center(
                        child: Text("No photos found."),
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 15, top: 8, bottom: 5, right: 15),
                            child: Text(
                              "Total: ${photoModel.length} Item",
                              style: const TextStyle(
                                color: CustomColor.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.separated(
                              itemCount: photoModel.length,
                              itemBuilder: (context, index) {
                                return PhotoList(
                                  photoUrl: photoModel[index].thumbnailUrl,
                                  photoTitle: photoModel[index].title,
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      AppRoute.detailsView,
                                      arguments: photoModel[index],
                                    );
                                  },
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const Divider();
                              },
                            ),
                          ),
                        ],
                      ),
              );
            }
          },
        ),
      ),
    );
  }
}
