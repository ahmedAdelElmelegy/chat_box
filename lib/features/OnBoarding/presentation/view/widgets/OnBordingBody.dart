import 'package:chat_app/core/Functions/Responsive_Text.dart';
import 'package:chat_app/core/utils/Assets.dart';
import 'package:chat_app/core/utils/go_router.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CusotmAllIconSignUp.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomButton.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomNavigationLogin.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomRowDivder.dart';
import 'package:chat_app/features/SignUp/presentation/view/SignUpView.dart';
import 'package:flutter/material.dart';

class OnBoardingBody extends StatelessWidget {
  const OnBoardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color(0xff271735),
          Colors.black,
        ], begin: Alignment.topLeft, end: Alignment.bottomLeft)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height * .1,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(Assets.logoLogin),
                  SizedBox(
                    width: size.width * .01,
                  ),
                  const CustomText(
                    text: 'ChatBox',
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(
                height: size.height * .01,
              ),
              CustomText(
                text: 'Connect friends \neasily & quickly',
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: RespText.getResponsiveFontSize(
                  64,
                  context,
                ),
              ),
              SizedBox(
                height: size.height * .01,
              ),
              CustomText(
                text:
                    'Our chat app is the perfect way to stay\nconnected with friends and family.',
                color: Colors.grey,
                fontSize: RespText.getResponsiveFontSize(
                  18,
                  context,
                ),
                fontWeight: FontWeight.w500,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              const CustomAllIconSignup(
                color: Colors.black,
                color2: Colors.white,
              ),
              SizedBox(
                height: size.height * .01,
              ),
              CustomRowDivider(size: size, color: Colors.white),
              SizedBox(
                height: size.height * .03,
              ),
              CustomBotton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const SignUpView();
                    },
                  ));
                },
                color: Colors.white,
                color2: Colors.black,
                text: 'Sign in with mail',
              ),
              SizedBox(
                height: size.height * .01,
              ),
              const CustomNavigateLogin()
            ],
          ),
        ),
      ),
    );
  }
}
