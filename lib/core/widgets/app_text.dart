import 'package:real_estate_moniepoint_test/core/utils/constants.dart';
import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  const AppText(
    this.text, {
    Key? key,
    this.color,
    this.align,
    this.size,
    this.weight,
    this.spacing,
    this.height,
    this.maxLines,
    this.overflow,
  }) : super(key: key);

  final String text;
  final Color? color;
  final TextAlign? align;
  final double? size;
  final FontWeight? weight;
  final double? spacing;
  final double? height;
  final int? maxLines;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: align ?? TextAlign.start,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        height: height,
        fontSize: size ?? 16,
        letterSpacing: spacing,
        color: color ?? kContrastColor,
        fontFamily: "Satoshi",
        fontWeight: weight ?? FontWeight.w400,
      ),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText(this.title, {Key? key, this.align}) : super(key: key);

  final String title;
  final TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return AppText(
      title,
      size: 17,
      color: kDarkTextColor,
      weight: FontWeight.w700,
      align: align ?? TextAlign.center,
    );
  }
}
