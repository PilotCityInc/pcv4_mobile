// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({Key? key, this.Imagesrc = ''}) : super(key: key);

  final String Imagesrc;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(Imagesrc), fit: BoxFit.cover)),
    );
  }
}
