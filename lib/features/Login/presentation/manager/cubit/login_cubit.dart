import 'package:chat_app/core/utils/Constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  static LoginCubit get(context) => BlocProvider.of(context);
  Future<void> loginUser(
      {required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserCredential user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      SharedPreferences shared = await SharedPreferences.getInstance();
      shared.setString('userId', user.user!.uid);
      Constants.userId = shared.getString('userId');
      emit(LoginSucess(user: user.user!));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(LoginFailed(erorrMessage: 'user not found'));
      } else if (e.code == 'wrong-password') {
        emit(LoginFailed(erorrMessage: 'wrong password'));
      }
    }
  }
}
