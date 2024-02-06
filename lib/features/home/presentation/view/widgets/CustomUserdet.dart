import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/go_router.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/features/SignUp/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:chat_app/features/home/presentation/view/widgets/massage_detailes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomUserdet extends StatelessWidget {
  const CustomUserdet({super.key, required this.userdata});
  final UserModel userdata;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MassageDetails(user: userdata),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.only(
          top: 20,
          right: 8,
          left: 8,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: Colors.greenAccent,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(userdata.image ??
                    'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1707257243~exp=1707257843~hmac=fb55a7d8492028700c658dfb79e1728987f7f89fffd2f81c55b1729f42b8c34a'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: userdata.name!,
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                  CustomText(
                    text: userdata.bio ?? '',
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
