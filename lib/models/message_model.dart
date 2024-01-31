class MessageModel {
  static const String COLLECTION_NAME = 'Messages';

  String id;
  String message;
  String date;

  MessageModel({this.id = '', required this.message, required this.date});

  MessageModel.fromFireStore(Map<String, dynamic> json)
      : this(
          id: json['id'],
          message: json['message'],
          date: json['date'],
        );

  Map<String, dynamic> addMessageToFireStore() {
    return {
      'id': id,
      'message': message,
      'date': date,
    };
  }
}
