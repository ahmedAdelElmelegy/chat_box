import 'package:chat_app/core/Functions/Responsive_Text.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';

class CustomPersonStatus extends StatelessWidget {
  const CustomPersonStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
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
          CustomText(
            text: 'Name',
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: RespText.getResponsiveFontSize(20, context),
          )
        ],
      ),
    );
  }
}
