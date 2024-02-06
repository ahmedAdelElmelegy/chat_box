import 'package:chat_app/features/home/presentation/view/widgets/HomeViewBody.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, this.user});
  final User? user;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: HomeViewBody(size: size)),
    );
  }
}
