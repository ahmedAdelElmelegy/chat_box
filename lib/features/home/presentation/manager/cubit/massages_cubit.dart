import 'package:bloc/bloc.dart';
import 'package:chat_app/core/models/Chat_model.dart';
import 'package:chat_app/core/utils/Constant.dart';
import 'package:chat_app/features/home/presentation/manager/cubit/home_cubit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'massages_state.dart';

class MassagesCubit extends Cubit<MassagesState> {
  MassagesCubit() : super(MassagesInitial());
  static MassagesCubit get(context) => BlocProvider.of(context);

  void sendMassage({required String message, required String reseverId}) async {
    emit(SendMassageLoading());
    ChatModel chat = ChatModel(
        message: message,
        dateTime: DateTime.now().toString(),
        senderId: Constants.userId,
        reseverId: reseverId);
    await FirebaseFirestore.instance
        .collection("users")
        .doc(Constants.userId)
        .collection('chats')
        .doc(reseverId)
        .collection('Massages')
        .add(chat.toMap())
        .then((value) {
      emit(SendMassageSucess());
      debugPrint("massage Send Sucess");
    }).catchError((error) {
      emit(SendMassageFailed());
    });
    await FirebaseFirestore.instance
        .collection("users")
        .doc(reseverId)
        .collection('chats')
        .doc(Constants.userId)
        .collection('Massages')
        .add(chat.toMap())
        .then((value) {
      emit(SendMassageSucess());
      debugPrint("massage Send Sucess");
    }).catchError((error) {
      emit(SendMassageFailed());
    });
  }

  List<ChatModel> message = [];
  void getMassages({required reseverId}) async {
    emit(GetMassagesLoading());
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(Constants.userId)
          .collection('chats')
          .doc(reseverId)
          .collection('Massages')
          .orderBy('dateTime')
          .snapshots()
          .listen((event) {
        message.clear();
        for (var i in event.docs) {
          message.add(ChatModel.fromJson(i.data()));
        }
      });
      emit(GetMassagesSucess());
    } catch (e) {
      emit(GetMassagesFailed());
    }
  }
}
