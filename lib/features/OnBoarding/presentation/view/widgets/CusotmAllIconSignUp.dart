import 'package:chat_app/core/utils/Assets.dart';
import 'package:chat_app/core/widgets/CustomLoading.dart';
import 'package:chat_app/features/HomeNavgateBar/presentation/view/HomeNavgateBar.dart';
import 'package:chat_app/features/OnBoarding/presentation/manager/OnBording/on_bording_cubit.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomIconSite.dart';
import 'package:chat_app/features/home/presentation/view/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAllIconSignup extends StatelessWidget {
  const CustomAllIconSignup({
    super.key,
    this.color,
    this.color2,
  });
  final Color? color;
  final Color? color2;
  @override
  Widget build(BuildContext context) {
    return BlocListener<OnBordingCubit, OnBordingState>(
        listener: (context, state) {
          var cubit = OnBordingCubit.get(context);
          if (state is OnBordingLoading) {
            const CustomLoading();
          } else if (state is OnBordingSucess) {
            Navigator.push(context, PageRouteBuilder(
              pageBuilder: (context, animation, secondaryAnimation) {
                return HomeNavigateBar(
                  user: state.user,
                );
              },
            ));
          }
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CutomIconsSite(
              color: color,
              color2: color2,
              image: Assets.faceLogo,
            ),
            GestureDetector(
              onTap: () {
                BlocProvider.of<OnBordingCubit>(context).signInWithGoogle();
              },
              child: CutomIconsSite(
                color: color,
                color2: color2,
                image: Assets.googelLogo,
              ),
            ),
            CutomIconsSite(
              color: color,
              color2: color2,
              image: Assets.appleLogo,
            ),
          ],
        ));
  }
}
