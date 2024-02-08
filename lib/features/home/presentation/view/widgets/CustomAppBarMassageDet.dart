import 'package:chat_app/core/Functions/Responsive_Text.dart';
import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/Assets.dart';
import 'package:chat_app/core/utils/Constant.dart';
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
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        CircleAvatar(
          radius: 25,
          backgroundImage: NetworkImage(user.image ?? Constants.defaultImage),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: size.width * .35,
                child: CustomText(
                  text: user.name!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  fontSize: RespText.getResponsiveFontSize(18, context),
                  fontWeight: FontWeight.bold,
                ),
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
