import 'package:chat_app/core/widgets/CustomFieldMassage.dart';

import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomButton.dart';
import 'package:chat_app/features/settings/presentation/manager/Profile_cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfile extends StatelessWidget {
  EditProfile({super.key});
  final nameController = TextEditingController();
  final bioController = TextEditingController();
  final phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        nameController.text = cubit.userdata?.name ?? '';
        bioController.text = cubit.userdata?.bio ?? '';
        phoneController.text = cubit.userdata?.phone ?? '';
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.check,
                    size: 30,
                  ))
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Stack(alignment: Alignment.bottomRight, children: [
                      cubit.profileImage == null
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  NetworkImage(cubit.userdata!.image!),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage: FileImage(cubit.profileImage!)),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.blue,
                        child: CircleAvatar(
                          radius: 17,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                cubit.setProfileImage();
                              },
                              icon: const Icon(
                                Icons.camera_alt,
                                size: 18,
                              )),
                        ),
                      )
                    ]),
                  ),
                  cubit.profileImage != null
                      ? Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10, top: 40, right: 50, left: 50),
                          child: Column(
                            children: [
                              CustomBotton(
                                  text: 'Edit Profile Image',
                                  color: Colors.lightBlue,
                                  color2: Colors.white,
                                  onPressed: () {
                                    cubit.uploudProfileImage(
                                        name: nameController.text,
                                        bio: bioController.text,
                                        phone: phoneController.text);
                                  }),
                              const CustomSizeBox(
                                h: .007,
                              ),
                              if (state is UplodeProfileImageLoading)
                                const LinearProgressIndicator()
                            ],
                          ))
                      : const CustomSizeBox(
                          h: .01,
                        ),
                  const CustomSizeBox(
                    h: .05,
                  ),
                  CustomTextField(
                    hintText: 'Name',
                    controller: nameController,
                  ),
                  const CustomSizeBox(
                    h: .02,
                  ),
                  CustomTextField(hintText: 'bio', controller: bioController),
                  const CustomSizeBox(
                    h: .02,
                  ),
                  CustomTextField(
                      hintText: 'phone', controller: phoneController),
                  const CustomSizeBox(
                    h: .02,
                  ),
                  if (state is EditProfileLoading)
                    const LinearProgressIndicator(),
                  const CustomSizeBox(
                    h: .02,
                  ),
                  CustomBotton(
                    text: 'Edit',
                    color: Colors.green,
                    color2: Colors.white,
                    onPressed: () {
                      cubit.editData(
                          name: nameController.text,
                          bio: bioController.text,
                          phone: phoneController.text);
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
