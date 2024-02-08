import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/features/settings/presentation/view/widgets/EditProfile.dart';

import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.text,
    this.icon,
    this.onPressed1,
    this.onPressed2,
    this.icon2,
  });

  final String text;
  final IconData? icon;
  final IconData? icon2;
  final void Function()? onPressed1;
  final void Function()? onPressed2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onPressed1,
            icon: Icon(
              icon2,
              color: Colors.white,
            ),
          ),
          CustomText(
            text: text,
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          IconButton(
              onPressed: onPressed2,
              icon: Icon(
                icon,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
