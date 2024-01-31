import 'package:chat_app/core/utils/go_router.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/features/Login/presentation/view/Login_view.dart';

import 'package:flutter/material.dart';

class CustomNavigateLogin extends StatelessWidget {
  const CustomNavigateLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CustomText(
          text: 'Existing account?',
          color: Colors.grey,
        ),
        TextButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const LoginView();
                },
              ));
            },
            child: CustomText(
              text: 'Login',
              color: Colors.white..withOpacity(.003),
            ))
      ],
    );
  }
}
