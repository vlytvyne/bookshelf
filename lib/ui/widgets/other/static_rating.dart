import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class StaticRating extends StatelessWidget {

  final int rating;
  final int size;

  const StaticRating(this.rating, {super.key, this.size = 20,});

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      itemSize: size.toDouble(),
      ignoreGestures: true,
      initialRating: rating.toDouble(),
      direction: Axis.horizontal,
      itemCount: 5,
      unratedColor: Colors.grey[300],
      onRatingUpdate: (rating) {},
      itemBuilder: (context, _) => const Icon(
        Icons.star,
        color: Colors.amber,
      ),
    );
  }
}
