import 'package:chat_app/features/Login/presentation/view/widgets/LoginAppbar.dart';
import 'package:chat_app/features/SignUp/presentation/view/widgets/SignUpViewbody.dart';
import 'package:flutter/material.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: SignUpViewBody(),
    );
  }
}
