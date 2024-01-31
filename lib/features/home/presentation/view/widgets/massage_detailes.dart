import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomAppBarMassageDet.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomMassageItem.dart';
import 'package:chat_app/features/home/presentation/view/widgets/Custom_field_Send_massage.dart';
import 'package:flutter/material.dart';

class MassageDetails extends StatelessWidget {
  const MassageDetails({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          const CustomSizeBox(
            h: .04,
          ),
          CustomAppBarMassageDet(user: user),
          const CustomSizeBox(
            h: .01,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) => const Padding(
                padding: EdgeInsets.only(bottom: 15, left: 10),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CustomMassageItem(),
                ),
              ),
            ),
          ),
          CustomFieldSendMassage(size: size)
        ],
      ),
    );
  }
}
