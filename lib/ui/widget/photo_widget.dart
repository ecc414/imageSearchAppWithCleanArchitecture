import 'package:flutter/material.dart';
import 'package:image_search/model/photo.dart';

class PhotoWidget extends StatelessWidget {
  final Photo photo;

  const PhotoWidget({
    Key? key,
    required this.photo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(photo.previewURL),
          ),
          borderRadius: const BorderRadius.all(Radius.circular(16.0))),
    );
  }
}
