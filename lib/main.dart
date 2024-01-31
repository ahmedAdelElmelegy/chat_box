import 'package:chat_app/core/utils/Constant.dart';
import 'package:chat_app/core/utils/cach_helper.dart';
import 'package:chat_app/core/utils/go_router.dart';
import 'package:chat_app/features/HomeNavgateBar/presentation/manager/cubit/home_navagation_cubit.dart';
import 'package:chat_app/features/HomeNavgateBar/presentation/view/HomeNavgateBar.dart';
import 'package:chat_app/features/Login/presentation/manager/cubit/login_cubit.dart';
import 'package:chat_app/features/OnBoarding/presentation/view/OnBoardingView.dart';
import 'package:chat_app/features/SignUp/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:chat_app/features/SignUp/presentation/view/SignUpView.dart';
import 'package:chat_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chat_app/features/settings/presentation/manager/cubit/profile_cubit.dart';
import 'package:chat_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SharedPreferences shared = await SharedPreferences.getInstance();
  Constants.userId = shared.getString('userId');
  runApp(const ChatBox());
}

class ChatBox extends StatelessWidget {
  const ChatBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignUpCubit(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => HomeNavagationCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getProfileData(),
        ),
        BlocProvider(
          create: (context) => HomeCubit()..getAllUsers(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Constants.userId != null
            ? const HomeNavigateBar()
            : const OnBordingView(),
      ),
    );
  }
}
