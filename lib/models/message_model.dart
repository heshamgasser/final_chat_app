import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  static const String COLLECTION_NAME = 'Messages';

  String id;
  String message;
  DateTime createdAt;

  MessageModel({this.id = '', required this.message, required this.createdAt});

  MessageModel.fromFireStore(Map<String, dynamic> json)
      : this(
          id: json['id'],
          message: json['message'],
          createdAt: (json['createdAt'] as Timestamp).toDate(),
        );

  Map<String, dynamic> addMessageToFireStore() {
    return {
      'id': id,
      'message': message,
      'createdAt': createdAt,
    };
  }
}
