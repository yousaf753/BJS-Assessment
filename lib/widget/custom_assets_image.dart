import 'package:flutter/material.dart';

Widget customAssetsImage({required String image, required BoxFit fit}) {
  return Image.asset(
    image,
    fit: fit,
    alignment: Alignment.center,
  );
}