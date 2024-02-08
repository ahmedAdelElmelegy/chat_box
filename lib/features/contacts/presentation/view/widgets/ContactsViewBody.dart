import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomUserdetListView.dart';
import 'package:chat_app/features/settings/presentation/view/widgets/CustomAppbar.dart';
import 'package:flutter/material.dart';

class ContactViewbody extends StatelessWidget {
  const ContactViewbody({super.key});

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
                    child: const CustomAppBar(text: "Contacts"),
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
        )
      ],
    );
  }
}
