import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomAppbarSearch.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomPersonListView.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomUserdetListView.dart';
import 'package:chat_app/features/settings/presentation/manager/Profile_cubit/profile_cubit.dart';
import 'package:chat_app/features/settings/presentation/view/widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  HomeViewBody({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                      height: size.height * .07,
                      child: BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          var cubit = ProfileCubit.get(context);

                          return CustomAppBar(
                            onPressed1: () {
                              cubit.openDarawer();
                            },
                            text: 'Home',
                            icon: Icons.search,
                            icon2: Icons.menu,
                          );
                        },
                      )),
                  const CustomSizeBox(
                    h: .03,
                  ),
                  SizedBox(
                      height: size.height * .12,
                      child: const CustomPersonListView()),
                  const CustomSizeBox(
                    h: .01,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: CustomUserdetListView(),
        )
      ],
    );
  }
}
