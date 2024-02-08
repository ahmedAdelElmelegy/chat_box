import 'package:chat_app/core/widgets/CustomText.dart';
import 'package:chat_app/core/widgets/CustomTextfield.dart';
import 'package:chat_app/core/widgets/Customsizebox.dart';
import 'package:chat_app/features/HomeNavgateBar/presentation/view/HomeNavgateBar.dart';
import 'package:chat_app/features/Login/presentation/manager/cubit/login_cubit.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CusotmAllIconSignUp.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomButton.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/widgets/CustomRowDivder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginFailed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.erorrMessage)));
        } else if (state is LoginSucess) {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeNavigateBar(),
              ));
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
                  text: 'Log in to Chatbox',
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                  textAlign: TextAlign.center,
                ),
                const CustomSizeBox(
                  h: .01,
                ),
                const CustomText(
                  text:
                      'Welcome back! Sign in using your social\n account or email to continue us',
                  color: Colors.grey,
                  fontSize: 16,
                  textAlign: TextAlign.center,
                ),
                const CustomSizeBox(
                  h: .01,
                ),
                const CustomAllIconSignup(
                  color: Colors.black,
                  color2: Colors.white,
                ),
                const CustomSizeBox(
                  h: .01,
                ),
                CustomRowDivider(
                  color: Colors.black,
                  size: size,
                ),
                const CustomSizeBox(
                  h: .1,
                ),
                CustomTextField(
                  controller: emailController,
                  icon2: Icons.email,
                  hintText: 'Your Email',
                  validator: (data) {
                    if (data!.isEmpty) {
                      return 'the email is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const CustomSizeBox(
                  h: .03,
                ),
                CustomTextField(
                  controller: passwordController,
                  icon2: Icons.key,
                  hintText: 'Password',
                  validator: (
                    data,
                  ) {
                    if (data!.isEmpty) {
                      return 'the password is empty';
                    } else {
                      return null;
                    }
                  },
                ),
                const CustomSizeBox(
                  h: .1,
                ),
                CustomBotton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      var cubit = LoginCubit.get(context);
                      cubit.loginUser(
                          email: emailController.text,
                          password: passwordController.text);
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => const HomeNavigateBar(),
                      //     ));
                    }
                  },
                  color: const Color(0xff24786d),
                  text: 'Login',
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
