import 'package:chat_app/core/models/Settings_model.dart';

import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomSettingsItem extends StatelessWidget {
  const CustomSettingsItem({
    super.key,
    required this.data,
  });
  final SettingsModel data;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(bottom: size.height * .066),
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: data.icon,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: data.title,
                  fontSize: 20,
                ),
                CustomText(
                  text: data.subtitle,
                  color: Colors.grey,
                  fontSize: 14,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
