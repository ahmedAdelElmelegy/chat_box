import 'package:chat_app/features/OnBoarding/presentation/view/widgets/OnBordingBody.dart';
import 'package:flutter/material.dart';

class OnBordingView extends StatelessWidget {
  const OnBordingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // backgroundColor: Colors.black,
      body: OnBoardingBody(),
    );
  }
}
