import 'package:chat_app/core/models/Chat_model.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomMassageMyFriend extends StatelessWidget {
  const CustomMassageMyFriend({super.key, required this.chatModel});
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(
              'https://img.freepik.com/free-photo/close-up-portrait-young-man-isolated-black-wall-real-emotions-male-model-smiling-feeling-happy-facial-expression-pure-clear-human-emotions-concept_155003-28037.jpg?size=626&ext=jpg&ga=GA1.2.1404103646.1692976429&semt=ais'),
        ),
        Flexible(
          child: Container(
            padding:
                const EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.4),
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20))),
            child: CustomText(
              text: chatModel.message!,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
