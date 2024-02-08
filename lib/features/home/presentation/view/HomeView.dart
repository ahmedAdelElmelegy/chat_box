import 'package:chat_app/features/home/presentation/view/widgets/CustomDrawer.dart';
import 'package:chat_app/features/home/presentation/view/widgets/HomeViewBody.dart';
import 'package:chat_app/features/settings/presentation/manager/Profile_cubit/profile_cubit.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          key: cubit.scaffoldKey,
          drawer: const CustomDrawer(),
          backgroundColor: Colors.black,
          body: SafeArea(child: HomeViewBody(size: size)),
        );
      },
    );
  }
}
