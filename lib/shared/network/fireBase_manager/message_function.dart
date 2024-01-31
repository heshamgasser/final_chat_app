import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_chat_app/models/message_model.dart';

class MessageFunction {
  static CollectionReference<MessageModel> createMessageCollection() {
    return FirebaseFirestore.instance
        .collection(MessageModel.COLLECTION_NAME)
        .withConverter<MessageModel>(
      fromFirestore: (snapshot, options) {
        return MessageModel.fromFireStore(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.addMessageToFireStore();
      },
    );
  }

  static void addMessagesToFireStore(MessageModel messageModel) {
    var collectionRef = createMessageCollection();
    var docRef = collectionRef.doc();
    messageModel.id = docRef.id;
    docRef.set(messageModel);
  }

  static Stream<QuerySnapshot<MessageModel>> getMessagesFromFireStore() {
    var collectionRef = createMessageCollection();
    return collectionRef.orderBy('createdAt', descending: true).snapshots();
  }
}
