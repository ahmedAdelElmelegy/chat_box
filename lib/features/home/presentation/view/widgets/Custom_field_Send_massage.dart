import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/widgets/CustomTextfield.dart';
import 'package:chat_app/features/home/presentation/manager/cubit/massages_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomFieldSendMassage extends StatelessWidget {
  CustomFieldSendMassage({
    super.key,
    required this.size,
    required this.user,
  });

  final Size size;
  final UserModel user;
  var messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MassagesCubit, MassagesState>(
      builder: (context, state) {
        var cubit = MassagesCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.attachment,
                  )),
              SizedBox(
                width: size.width * .6,
                child: CustomTextField(
                  controller: messageController,
                  hintText: 'Write your massage',
                  fillcolor: Colors.grey.withOpacity(.3),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: IconButton(
                      onPressed: () {
                        cubit.sendMassage(
                            message: messageController.text,
                            reseverId: user.uid!);
                        messageController.clear();
                        cubit.animated();
                      },
                      icon: const Icon(
                        Icons.send,
                        color: Colors.white,
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
