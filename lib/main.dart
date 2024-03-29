import 'package:chat_app/core/utils/Constant.dart';

import 'package:chat_app/features/HomeNavgateBar/presentation/manager/cubit/home_navagation_cubit.dart';
import 'package:chat_app/features/Login/presentation/manager/cubit/login_cubit.dart';
import 'package:chat_app/features/OnBoarding/presentation/manager/OnBording/on_bording_cubit.dart';
import 'package:chat_app/features/SignUp/presentation/manager/cubit/sign_up_cubit.dart';
import 'package:chat_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:chat_app/features/home/presentation/manager/cubit/massages_cubit.dart';
import 'package:chat_app/features/settings/presentation/manager/Profile_cubit/profile_cubit.dart';
import 'package:chat_app/features/splash/presentation/view/SplashView.dart';
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
        BlocProvider(
          create: (context) => MassagesCubit(),
        ),
        BlocProvider(
          create: (context) => OnBordingCubit(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashView(),
      ),
    );
  }
}
