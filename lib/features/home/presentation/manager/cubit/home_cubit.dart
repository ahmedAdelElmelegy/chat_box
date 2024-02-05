import 'package:chat_app/core/models/Chat_model.dart';
import 'package:chat_app/core/models/UserModel.dart';
import 'package:chat_app/core/utils/Constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  List<UserModel> users = [];
  void getAllUsers() async {
    emit(HomeLoading());
    try {
      await FirebaseFirestore.instance.collection('users').get().then((value) {
        for (var i in value.docs) {
          if (i.id != Constants.userId) {
            users.add(UserModel.fromJson(i.data()));
          }
        }
        emit(HomeSucess());
      });
    } on FirebaseException catch (e) {
      users = [];
      emit(HomeFailed(errorMassage: e.toString()));
    }
  }

  List<UserModel> userSearch = [];
  void searchUser({required String userName}) {
    users.where((element) => element.name!.startsWith(userName)).toList();
    //search by the firsh key in user name
    emit(SearchSucess());
  }

  bool isSearch = false;

  void searchTransfer() {
    isSearch = !isSearch;

    emit(SearchSucess());
  }
}
