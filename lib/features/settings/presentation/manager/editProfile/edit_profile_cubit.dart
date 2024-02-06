import 'package:bloc/bloc.dart';
import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/Constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit() : super(EditProfileInitial());
  UserModel? userdata;

  Future<void> editData({
    required String name,
    required String bio,
    required String phone,
  }) async {
    emit(EditProfileLoading());
    UserModel userModel = UserModel(
        name: name ?? userdata!.name,
        bio: bio ?? userdata!.bio,
        email: userdata!.email,
        phone: phone ?? userdata!.phone,
        uid: userdata!.uid);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userdata!.uid)
        .update(userModel.toMap())
        .then((value) {
      emit(EditProfileSucess());
    }).catchError((error) {
      emit(EditProfileFailed());
    });
  }
}
