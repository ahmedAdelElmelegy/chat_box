import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomDivider.dart';
import 'package:flutter/material.dart';

class CustomRowDivider extends StatelessWidget {
  const CustomRowDivider({
    super.key,
    required this.size,
    this.color,
  });

  final Size size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomDivider(size: size),
        CustomText(
          text: 'Or',
          fontSize: 20,
          color: color,
        ),
        CustomDivider(
          size: size,
        ),
      ],
    );
  }
}
