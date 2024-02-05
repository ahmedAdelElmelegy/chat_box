import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/go_router.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
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
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 32,
              backgroundColor: Colors.greenAccent,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(
                    'https://img.freepik.com/free-photo/close-up-portrait-young-man-isolated-black-wall-real-emotions-male-model-smiling-feeling-happy-facial-expression-pure-clear-human-emotions-concept_155003-28037.jpg?size=626&ext=jpg&ga=GA1.2.1404103646.1692976429&semt=ais'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10),
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
