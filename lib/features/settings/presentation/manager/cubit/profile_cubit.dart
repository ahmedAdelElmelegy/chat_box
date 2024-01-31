import 'package:bloc/bloc.dart';
import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/Constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel? userdata;
  Future<void> getProfileData() async {
    emit(ProfileLoading());
    await FirebaseFirestore.instance
        .collection('users')
        .doc(Constants.userId)
        .get()
        .then((value) {
      userdata = UserModel.fromJson(value.data()!);
      emit(ProfileSucess());
    }).catchError((error) {
      emit(ProfileFailed());
    });
  }
}
