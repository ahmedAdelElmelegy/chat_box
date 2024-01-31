import 'package:chat_app/features/Login/presentation/view/widgets/LoginAppbar.dart';
import 'package:chat_app/features/Login/presentation/view/widgets/login_view_body.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(context),
      body: LoginViewBody(),
    );
  }
}
