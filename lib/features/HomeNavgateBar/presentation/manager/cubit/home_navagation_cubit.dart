import 'package:bloc/bloc.dart';
import 'package:chat_app/core/utils/Assets.dart';
import 'package:chat_app/features/Calls/presentation/view/CallsView.dart';
import 'package:chat_app/features/contacts/presentation/view/ContactsView.dart';
import 'package:chat_app/features/home/presentation/view/HomeView.dart';
import 'package:chat_app/features/settings/presentation/view/SettingsView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:iconly/iconly.dart';

part 'home_navagation_state.dart';

class HomeNavagationCubit extends Cubit<HomeNavagationState> {
  HomeNavagationCubit() : super(HomeNavagationInitial());
  int currentIndex = 0;
  static HomeNavagationCubit get(context) => BlocProvider.of(context);

  void homeNavigation(int index) {
    currentIndex = index;
    emit(HomeNavagationSucess());
  }

  List<NavigationDestination> item = [
    NavigationDestination(
        icon: SvgPicture.asset(Assets.message),
        selectedIcon: SvgPicture.asset(Assets.message),
        label: 'Message'),
    NavigationDestination(
        icon: SvgPicture.asset(Assets.call),
        selectedIcon: SvgPicture.asset(Assets.call),
        label: 'Calls'),
    NavigationDestination(
        icon: SvgPicture.asset(Assets.user),
        selectedIcon: SvgPicture.asset(Assets.user),
        label: 'Contacts'),
    const NavigationDestination(
        icon: Icon(IconlyLight.setting),
        selectedIcon: Icon(IconlyBold.setting),
        label: 'Settings'),
  ];
  List<Widget> pages = [
    HomeView(),
    CallView(),
    ContactView(),
    SettingsView(),
  ];
}
