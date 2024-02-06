import 'package:bloc/bloc.dart';
import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/Constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'on_bording_state.dart';

class OnBordingCubit extends Cubit<OnBordingState> {
  OnBordingCubit() : super(OnBordingInitial());
  static OnBordingCubit get(context) => BlocProvider.of(context);

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleUser.authentication;

        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        final UserCredential authResult =
            await _auth.signInWithCredential(credential);
        final User? user = authResult.user;

        SharedPreferences sharedPreferences =
            await SharedPreferences.getInstance();
        sharedPreferences.setString(
          'userId',
          user!.uid,
        );

        Constants.userId = sharedPreferences.getString('userId');
        print(user.displayName);
        if (user != null) {
          await _storeUserData(user);

          emit(OnBordingSucess(user));
        }
      }
    } catch (e) {
      print('Error signing in with Google: $e');
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
      emit(UnAuthentication());
    } catch (e) {
      print('Error signing out: $e');
    }
  }

  //sign in with facebook
}

Future<void> _storeUserData(User user) async {
  try {
    final userDoc =
        FirebaseFirestore.instance.collection('users').doc(user.uid);
    final userSnapshot = await userDoc.get();
    UserModel userModel = UserModel(
        name: user.displayName,
        phone: user.phoneNumber,
        bio: 'please write your bio',
        email: user.email,
        uid: user.uid);
    if (!userSnapshot.exists) {
      await userDoc.set(userModel.toMap());
    }
  } catch (error) {
    print('Error storing user data: $error');
  }
}
