import 'package:chat_app/features/home/presentation/view/widgets/CustomPersonStatus.dart';
import 'package:flutter/material.dart';

class CustomPersonListView extends StatelessWidget {
  const CustomPersonListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => const CustomPersonStatus(),
    );
  }
}
