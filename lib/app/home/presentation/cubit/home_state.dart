part of 'home_cubit.dart';

abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {}

class MessageLoading extends HomeState {}

class MessageLoaded extends HomeState {
  final List<MessageModel> messageList;
  const MessageLoaded({required this.messageList});
}

class MessageError extends HomeState {
  final String message;
  const MessageError({required this.message});
}
