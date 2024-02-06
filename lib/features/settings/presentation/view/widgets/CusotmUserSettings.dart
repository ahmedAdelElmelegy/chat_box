import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/Assets.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomUserSetting extends StatelessWidget {
  const CustomUserSetting({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: Colors.greenAccent,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.image!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: user.name!,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                CustomText(
                  text: user.bio!,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  fontSize: 14,
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(Assets.qrCode))
        ]));
  }
}
