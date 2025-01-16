import 'package:bookly/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BookItem extends StatelessWidget {
  const BookItem({super.key,required this.image});
  final String image;

  @override
  Widget build(BuildContext context) {
    return  ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
        aspectRatio: 150/224,
        child: CachedNetworkImage(
          imageUrl: image,
          fit: BoxFit.fill,

        ),
      ),
    );
  }
}
