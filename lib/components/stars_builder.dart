import 'package:flutter/material.dart';

class StarsBuilder extends StatelessWidget {
  const StarsBuilder({Key? key, required this.rating}) : super(key: key);

  final int rating;

  @override
  Widget build(BuildContext context) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐  ';
    }
    stars.trim();
    return Text(stars);
  }
}
