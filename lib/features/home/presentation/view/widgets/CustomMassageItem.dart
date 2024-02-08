import 'package:chat_app/core/models/Chat_model.dart';
import 'package:chat_app/core/utils/Constant.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomMassageItem extends StatelessWidget {
  const CustomMassageItem({
    super.key,
    required this.chatModel,
  });
  final ChatModel chatModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(
          child: Container(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 10, left: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.blue.withOpacity(.4),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              child: CustomText(
                text: chatModel.message!,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              )),
        ),
        CircleAvatar(
          radius: 25,
          backgroundImage:
              NetworkImage(chatModel.image ?? Constants.defaultImage),
        ),
      ],
    );
  }
}
