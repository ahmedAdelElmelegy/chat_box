import 'package:chat_app/core/widgets/CustomLoading.dart';
import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/core/widgets/CustomTextfield.dart';
import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomButton.dart';
import 'package:chat_app/features/SignUp/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpViewBody extends StatelessWidget {
  SignUpViewBody({super.key});
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.errorMassage)));
        } else if (state is SignUpLoading) {
          const CustomLoading();
        } else if (state is SignUpSucess) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('sucess')));
        }
      },
      child: Form(
        key: formkey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomText(
                  text: 'Sign up with Email',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
                const CustomSizeBox(
                  h: .01,
                ),
                const CustomText(
                  text:
                      'Get chatting with friends and family today by\n signing up for our chat app!',
                  color: Colors.grey,
                  fontSize: 16,
                  textAlign: TextAlign.center,
                ),
                const CustomSizeBox(
                  h: .1,
                ),
                CustomTextField(
                  hintText: 'Your name',
                  icon2: Icons.person,
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'the name is empty';
                    } else {
                      return null;
                    }
                  },
                  controller: nameController,
                ),
                const CustomSizeBox(
                  h: .03,
                ),
                CustomTextField(
                  hintText: 'Phone',
                  icon2: Icons.phone,
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'the phone is empty';
                    } else {
                      return null;
                    }
                  },
                  controller: phoneController,
                ),
                const CustomSizeBox(
                  h: .03,
                ),
                CustomTextField(
                  hintText: 'Your email',
                  icon2: Icons.email,
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'the email is empty';
                    } else {
                      return null;
                    }
                  },
                  controller: emailController,
                ),
                const CustomSizeBox(
                  h: .03,
                ),
                CustomTextField(
                  hintText: 'Password',
                  icon2: Icons.key,
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'the password is empty';
                    } else {
                      return null;
                    }
                  },
                  controller: passwordController,
                ),
                const CustomSizeBox(
                  h: .1,
                ),
                CustomBotton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      BlocProvider.of<SignUpCubit>(context).signUp(
                          phone: phoneController.text,
                          name: nameController.text,
                          email: emailController.text,
                          password: passwordController.text);
                    }
                  },
                  color: const Color(0xff24786d),
                  text: 'Sign up',
                  color2: Colors.white,
                ),
                const CustomSizeBox(
                  h: .1,
                ),
                TextButton(
                    onPressed: () {},
                    child: const CustomText(text: 'forgot password?'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
