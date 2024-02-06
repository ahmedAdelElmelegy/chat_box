import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/Constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context) => BlocProvider.of(context);
  UserModel? userdata;
  Future<void> getProfileData() async {
    emit(ProfileLoading());
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Constants.userId)
          .get()
          .then((value) {
        userdata = UserModel.fromJson(value.data()!);
        emit(ProfileSucess());
      });
    } catch (e) {
      emit(ProfileFailed());
    }
  }

  Future<void> editData(
      {required String name,
      required String bio,
      required String phone,
      String? image}) async {
    emit(EditProfileLoading());
    UserModel userModel = UserModel(
        name: name ?? userdata!.name,
        bio: bio ?? userdata!.bio,
        email: userdata!.email,
        phone: phone ?? userdata!.phone,
        uid: userdata!.uid,
        image: image ?? userdata!.image);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userdata!.uid)
        .update(userModel.toMap())
        .then((value) {
      getProfileData();
      emit(EditProfileSucess());
    }).catchError((error) {
      emit(EditProfileFailed());
    });
  }

  File? profileImage;
  Future<void> setProfileImage() async {
    ImagePicker image = ImagePicker();
    final pickImage = await image.pickImage(source: ImageSource.gallery);
    if (image != null) {
      profileImage = File(pickImage!.path);
      emit(PickProfileImageSucess());
    } else {
      return;
    }
  }

  void uploudProfileImage(
      {required String name,
      required String bio,
      required String phone}) async {
    //ref is inside
    // put profile image put in storage
    emit(UplodeProfileImageLoading());
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref()
          .child('users/${Uri.file(profileImage!.path).pathSegments.last}')
          .putFile(profileImage!)
          .then((value) => {
                value.ref.getDownloadURL().then((value) {
                  editData(name: name, bio: bio, phone: phone, image: value);

                  // emit(UplodeProfileImageSucess());
                })
              });
    } catch (e) {
      UplodeProfileImageFailed();
    }
  }
}
