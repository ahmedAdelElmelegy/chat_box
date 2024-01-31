import 'package:chat_app/core/utils/Constant.dart';
import 'package:chat_app/core/widgets/CustomLoading.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomAppBarHome.dart';
import 'package:chat_app/features/settings/presentation/manager/cubit/profile_cubit.dart';
import 'package:chat_app/features/settings/presentation/view/widgets/CusotmUserSettings.dart';
import 'package:chat_app/features/settings/presentation/view/widgets/CustomSettingItemField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsViewBody extends StatelessWidget {
  const SettingsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        if (state is ProfileLoading) {
          return const CustomLoading();
        } else if (state is ProfileSucess) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const CustomSizeBox(
                  h: .03,
                ),
                Column(
                  children: [
                    SizedBox(
                      height: size.height * .07,
                      child: const CustomAppBarHome(),
                    ),
                    const CustomSizeBox(
                      h: .03,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Column(
                        children: [
                          const CustomSizeBox(
                            h: .02,
                          ),
                          CustomUserSetting(
                            user: cubit.userdata!,
                          ),
                          Column(
                            children: List.generate(
                                Constants.item.length,
                                (index) => CustomSettingsItem(
                                      data: Constants.item[index],
                                    )),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CustomText(text: "failed"),
          );
        }
      },
    );
  }
}
