import 'package:flutter/material.dart';
import 'package:photo_gallery_with_api/model/photo_model.dart';
import 'package:photo_gallery_with_api/utils/custom_color.dart';

class DetailsViewScreen extends StatelessWidget {
  final PhotoModel photoModel;

  const DetailsViewScreen({
    super.key,
    required this.photoModel,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Photo Details",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  height: screenSize.height*0.4,
                  width: screenSize.width*1.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(photoModel.url),
                      fit: BoxFit.cover
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  photoModel.title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: CustomColor.textColor
                  ),
                ),
                const SizedBox(height: 20,),
                Text(
                  "ID: ${photoModel.id.toString()}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: CustomColor.black
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
