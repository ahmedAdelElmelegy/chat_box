import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/Calls/presentation/view/widgets/CustomAppBarCalls.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomUserdetListView.dart';
import 'package:flutter/material.dart';

class CallViewBody extends StatelessWidget {
  const CallViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
                    child: const CustomAppBarCalls(),
                  ),
                  const CustomSizeBox(
                    h: .03,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: CustomUserdetListView(),
        ),
      ],
    );
  }
}
