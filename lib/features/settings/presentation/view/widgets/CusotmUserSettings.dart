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
              backgroundImage: NetworkImage(user.image ??
                  'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1707257243~exp=1707257843~hmac=fb55a7d8492028700c658dfb79e1728987f7f89fffd2f81c55b1729f42b8c34a'),
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
