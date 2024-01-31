import 'package:chat_app/core/widgets/CustomTextfield.dart';
import 'package:flutter/material.dart';

class CustomFieldSendMassage extends StatelessWidget {
  const CustomFieldSendMassage({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Row(
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.attachment,
              )),
          SizedBox(
            width: size.width * .7,
            child: CustomTextField(
              hintText: 'Write your massage',
              fillcolor: Colors.grey.withOpacity(.3),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Container(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(50),
              ),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.send,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
