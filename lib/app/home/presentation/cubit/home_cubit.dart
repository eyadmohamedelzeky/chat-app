import 'package:bloc/bloc.dart';
import 'package:chat_app/app/home/data/models/message_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
 TextEditingController messageController = TextEditingController();
  List<MessageModel>messageList=[];
  CollectionReference messages = FirebaseFirestore.instance.collection('messages');
  Future<void>getMessage()async{
    emit(MessageLoading());
    try{
      for(int i=0;i<messageList.length;i++){
        messageList.add(MessageModel.fromJson(messageList[i]));
      }
      emit(MessageLoaded(messageList:messageList));
    }catch(e){}
  }
}
