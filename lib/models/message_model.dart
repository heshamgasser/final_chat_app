import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  static const String COLLECTION_NAME = 'Messages';
  String userId;
  String id;
  String message;
  DateTime createdAt;

  MessageModel(
      {this.id = '',
      required this.userId,
      required this.message,
      required this.createdAt});

  MessageModel.fromFireStore(Map<String, dynamic> json)
      : this(
          userId: json['userId'],
          id: json['id'],
          message: json['message'],
          createdAt: (json['createdAt'] as Timestamp).toDate(),
        );

  Map<String, dynamic> addMessageToFireStore() {
    return {
      'userId': userId,
      'id': id,
      'message': message,
      'createdAt': createdAt,
    };
  }
}
