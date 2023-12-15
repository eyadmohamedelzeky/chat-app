class MessageModel {
  final String? message;
  MessageModel({
    required this.message,
  });
  factory MessageModel.fromJson(json) {
    return MessageModel(
      message: json['message'],
    );
  }
}
