import 'package:chat_app/features/HomeNavgateBar/presentation/manager/cubit/home_navagation_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeNavigateBar extends StatelessWidget {
  const HomeNavigateBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavagationCubit, HomeNavagationState>(
      builder: (context, state) {
        var cubit = HomeNavagationCubit.get(context);
        return Scaffold(
          bottomNavigationBar: NavigationBar(
            destinations: cubit.item,
            selectedIndex: cubit.currentIndex,
            onDestinationSelected: (value) {
              cubit.homeNavigation(value);
            },
          ),
          body: cubit.pages[cubit.currentIndex],
        );
      },
    );
  }
}
