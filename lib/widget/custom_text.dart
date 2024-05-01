import 'package:flutter/cupertino.dart';

Widget customText({required String text, required TextStyle? textStyle, int? maxLine, TextAlign? textAlign}) {
  return Text(
    text,
    style: textStyle,
    textAlign: textAlign,
    overflow: maxLine != null ? TextOverflow.ellipsis : null,
    maxLines: maxLine,
  );
}