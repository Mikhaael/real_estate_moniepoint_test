import 'dart:io';

import 'package:real_estate_moniepoint_test/core/utils/assets.dart';
import 'package:real_estate_moniepoint_test/core/utils/constants.dart';
import 'package:real_estate_moniepoint_test/core/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvatarPlaceholder extends StatelessWidget {
  const AvatarPlaceholder({
    Key? key,
    this.size,
    this.color,
    this.margin,
    this.avatar,
    this.avatarColor,
  }) : super(key: key);

  final double? size;
  final Color? color;
  final Color? avatarColor;
  final EdgeInsets? margin;
  final String? avatar;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 32,
      height: size ?? 32,
      margin: margin ?? const EdgeInsets.only(right: 16),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color ?? kPrimaryColor),
      child: avatar != null
          ? Center(child: SvgPicture.asset(avatar!, width: 20, height: 20))
          : Center(
              child:
                  Icon(Icons.person, size: 20, color: avatarColor ?? kWhite)),
    );
  }
}

class CircularContainer extends StatelessWidget {
  const CircularContainer({
    Key? key,
    this.size,
    this.color,
    this.margin,
    this.assetColor,
    this.assetSize,
    required this.asset,
  }) : super(key: key);

  final double? size;
  final Color? color;
  final Color? assetColor;
  final EdgeInsets? margin;
  final String asset;
  final double? assetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 32,
      height: size ?? 32,
      margin: margin ?? const EdgeInsets.only(right: 16),
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color ?? kPrimaryColor),
      child: Center(
        child: SvgPicture.asset(
          asset,
          width: assetSize ?? 20,
          color: assetColor,
          height: assetSize ?? 20,
        ),
      ),
    );
  }
}

class CircularImageContainer extends StatelessWidget {
  const CircularImageContainer({
    Key? key,
    this.size,
    this.color,
    this.margin,
    this.assetColor,
    this.assetSize,
    required this.asset,
  }) : super(key: key);

  final double? size;
  final Color? color;
  final Color? assetColor;
  final EdgeInsets? margin;
  final String asset;
  final double? assetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 32,
      height: size ?? 32,
      margin: margin ?? const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color ?? kPrimaryColor,
      ),
      child: ClipOval(
        child: Image.asset(
          asset,
          fit: BoxFit.cover,
          width: assetSize ?? size ?? 20,
          height: assetSize ?? size ?? 20,
        ),
      ),
    );
  }
}

class CircularContainerIcon extends StatelessWidget {
  const CircularContainerIcon({
    Key? key,
    this.size,
    this.color,
    this.margin,
    this.assetColor,
    this.assetSize,
    required this.icon,
  }) : super(key: key);

  final double? size;
  final Color? color;
  final Color? assetColor;
  final EdgeInsets? margin;
  final IconData icon;
  final double? assetSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size ?? 24,
      height: size ?? 24,
      decoration:
          BoxDecoration(shape: BoxShape.circle, color: color ?? kPrimaryColor),
      child: Center(
        child: Icon(icon,
            size: assetSize ?? 12, color: assetColor ?? kContrastColor),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    super.key,
    required this.title,
    this.onTap,
  });

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 54,
        height: 30,
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: AppText(
            title,
            color: kPrimaryColor,
            size: 13,
            weight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
