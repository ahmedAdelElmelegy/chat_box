import 'package:chat_app/core/utils/Assets.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBarCalls extends StatelessWidget {
  const CustomAppBarCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.white,
              size: 40,
            ),
          ),
          const CustomText(
            text: 'Calls',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: Colors.grey,
                )),
            child: IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  Assets.calluser,
                )),
          )
        ],
      ),
    );
  }
}
