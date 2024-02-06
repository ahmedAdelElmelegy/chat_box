import 'package:bloc/bloc.dart';
import 'package:chat_app/core/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());
  static SignUpCubit get(context) => BlocProvider.of(context);
  Future<void> signUp(
      {required String email,
      required String password,
      required String name,
      required String phone}) async {
    emit(SignUpLoading());
    try {
      UserCredential user =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      emit(SignUpSucess());
      userData(name: name, email: email, uid: user.user!.uid, phone: phone);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(SignUpFailed(errorMassage: 'weak-password'));
      } else if (e.code == 'email-already-in-use') {
        emit(SignUpFailed(errorMassage: 'email-already-in-use'));
      }
    }
  }

  Future<void> userData(
      {required String name,
      required String email,
      required String uid,
      required String phone}) async {
    emit(UserDataLoading());
    UserModel user = UserModel(
        email: email,
        name: name,
        phone: phone,
        uid: uid,
        image:
            'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1707257243~exp=1707257843~hmac=fb55a7d8492028700c658dfb79e1728987f7f89fffd2f81c55b1729f42b8c34a');
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(user.toMap())
        .then((value) {
      emit(UserDataSucess());
    }).catchError((error) {
      emit(UserDataFailed());
    });
  }
}
