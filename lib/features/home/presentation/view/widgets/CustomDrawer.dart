import 'package:chat_app/core/Functions/Responsive_Text.dart';

import 'package:chat_app/core/utils/Constant.dart';
import 'package:chat_app/core/widgets/CustomLoading.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/OnBoardingView.dart';
import 'package:chat_app/features/settings/presentation/manager/Profile_cubit/profile_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        if (state is ProfileLoading) {
          return const CustomLoading();
        } else if (state is ProfileSucess) {
          return Drawer(
            backgroundColor: Colors.white,
            child: Column(
              children: [
                DrawerHeader(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                          cubit.userdata?.image ?? Constants.defaultImage),
                    ),
                    CustomText(
                      text: cubit.userdata!.name!,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomText(
                      text: cubit.userdata!.bio!,
                      fontSize: RespText.getResponsiveFontSize(14, context),
                      color: Colors.grey,
                    ),
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      text: cubit.userdata!.email!,
                      fontSize: RespText.getResponsiveFontSize(14, context),
                      color: Colors.grey,
                    ),
                    IconButton(
                        onPressed: () {
                          cubit.logout();
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return const OnBordingView();
                            },
                          ));
                        },
                        icon: const Icon(Icons.logout))
                  ],
                ),
              ],
            ),
          );
        } else {
          return const CustomText(text: 'erorr');
        }
      },
    );
  }
}
