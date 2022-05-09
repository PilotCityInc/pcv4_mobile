import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key, required this.imageSrc}) : super(key: key);

  final String imageSrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imageSrc),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
