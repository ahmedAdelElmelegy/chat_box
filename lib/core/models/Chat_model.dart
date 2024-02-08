class ChatModel {
  final String? message;
  final String? senderId;
  final String? reseverId;
  final String? dateTime;
  final String? image;

  ChatModel(
      {this.message, this.senderId, this.reseverId, this.dateTime, this.image});
  factory ChatModel.fromJson(Map<String, dynamic> json) {
    return ChatModel(
      message: json['message'],
      senderId: json['senderId'],
      reseverId: json['reseverId'],
      dateTime: json['dataTime'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'senderId': senderId,
      'reseverId': reseverId,
      'dateTime': dateTime,
      'image': image
    };
  }
}
