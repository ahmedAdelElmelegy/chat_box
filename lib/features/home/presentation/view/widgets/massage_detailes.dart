import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/widgets/CustomLoading.dart';

import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/home/presentation/manager/cubit/massages_cubit.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomAppBarMassageDet.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomMassageItem.dart';
import 'package:chat_app/features/home/presentation/view/widgets/CustomMassageMyFriend.dart';
import 'package:chat_app/features/home/presentation/view/widgets/Custom_field_Send_massage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MassageDetails extends StatelessWidget {
  const MassageDetails({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
            child: Column(children: [
      CustomAppBarMassageDet(user: user),
      Expanded(
        child: BlocBuilder<MassagesCubit, MassagesState>(
          builder: (context, state) {
            var cubit1 = BlocProvider.of<MassagesCubit>(context)
                .getMassages(reseverId: user.uid);
            var cubit = MassagesCubit.get(context);
            if (state is GetMassagesLoading) {
              return const CustomLoading();
            } else if (state is GetMassagesSucess) {
              return ListView.builder(
                reverse: true,
                controller: cubit.scrollController,
                itemCount: cubit.message.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 10, top: 10),
                  child: cubit.message[index].senderId != user.uid
                      ? Align(
                          alignment: Alignment.topLeft,
                          child: CustomMassageMyFriend(
                              chatModel: cubit.message[index]))
                      : Align(
                          alignment: Alignment.topRight,
                          child: CustomMassageItem(
                              chatModel: cubit.message[index]),
                        ),
                ),
              );
            } else if (cubit.message.isEmpty) {
              return const Center(
                child: Text('No Massage  .....'),
              );
            } else {
              return const Center(
                child: Text('Loading .....'),
              );
            }
          },
        ),
      ),
      const CustomSizeBox(
        h: .01,
      ),
      CustomFieldSendMassage(
        user: user,
        size: size,
      )
    ])));
  }
}
