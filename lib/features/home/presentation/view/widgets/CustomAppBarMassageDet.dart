import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/Assets.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarMassageDet extends StatelessWidget {
  const CustomAppBarMassageDet({
    super.key,
    required this.user,
  });
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/close-up-portrait-young-man-isolated-black-wall-real-emotions-male-model-smiling-feeling-happy-facial-expression-pure-clear-human-emotions-concept_155003-28037.jpg?size=626&ext=jpg&ga=GA1.2.1404103646.1692976429&semt=ais'),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: user.name!,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              const CustomText(
                text: 'Active now',
                color: Colors.grey,
              ),
            ],
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.call),
        ),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(Assets.videoIcon),
        )
      ],
    );
  }
}
