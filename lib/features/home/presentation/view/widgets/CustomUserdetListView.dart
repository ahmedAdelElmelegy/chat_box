import 'package:chat_app/core/widgets/CustomLoading.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomButton.dart';
import 'package:chat_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomUserdet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomUserdetListView extends StatelessWidget {
  const CustomUserdetListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        var cubit = HomeCubit.get(context);

        if (state is HomeLoading) {
          return const CustomLoading();
        } else if (state is HomeSucess) {
          return Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: ListView.builder(
                itemCount: cubit.users.length,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    CustomUserdet(userdata: cubit.users[index]),
              ),
            ),
          );
        } else if (state is HomeFailed) {
          return Center(child: CustomText(text: state.errorMassage));
        } else {
          return const Center(
            child: CustomText(
              text: 'erorr',
              color: Colors.white,
            ),
          );
        }
      },
    );
  }
}
