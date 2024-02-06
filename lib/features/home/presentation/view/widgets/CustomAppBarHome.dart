import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/features/settings/presentation/view/widgets/EditProfile.dart';

import 'package:flutter/material.dart';

class CustomAppBarHome extends StatelessWidget {
  const CustomAppBarHome({
    super.key,
  });

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
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          const CustomText(
            text: 'Settings',
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return EditProfile();
                  },
                ));
              },
              icon: const Icon(
                Icons.edit,
                size: 30,
                color: Colors.white,
              ))
        ],
      ),
    );
  }
}
