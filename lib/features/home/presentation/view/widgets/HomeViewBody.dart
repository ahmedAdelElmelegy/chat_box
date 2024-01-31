import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomAppBarHome.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomAppbarSearch.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomPersonListView.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomUserdetListView.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
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
              const CustomSizeBox(
                h: .03,
              ),
              Column(
                children: [
                  SizedBox(
                    height: size.height * .07,
                    child: const CustomAppBarSearch(),
                  ),
                  const CustomSizeBox(
                    h: .03,
                  ),
                  SizedBox(
                      height: size.height * .11,
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
