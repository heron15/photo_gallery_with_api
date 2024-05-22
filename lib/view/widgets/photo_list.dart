import 'package:flutter/material.dart';

import '../../utils/custom_color.dart';

class PhotoList extends StatelessWidget {
  final String photoUrl;
  final String photoTitle;
  final VoidCallback? onTap;

  const PhotoList({
    super.key,
    required this.photoUrl,
    required this.photoTitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 80,
        child: Row(
          children: [
            Container(
              height: 70,
              width: 70,
              margin: const EdgeInsets.only(
                left: 10,
                top: 5,
                bottom: 5,
                right: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage(
                    photoUrl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Text(
                photoTitle,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: CustomColor.textColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
