import 'package:chat_app/core/utils/Assets.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomIconSite.dart';
import 'package:flutter/material.dart';

class CustomAllIconSignup extends StatelessWidget {
  const CustomAllIconSignup({
    super.key,
    this.color,
    this.color2,
  });
  final Color? color;
  final Color? color2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CutomIconsSite(
          color: color,
          color2: color2,
          image: Assets.faceLogo,
        ),
        CutomIconsSite(
          color: color,
          color2: color2,
          image: Assets.googelLogo,
        ),
        CutomIconsSite(
          color: color,
          color2: color2,
          image: Assets.appleLogo,
        ),
      ],
    );
  }
}
