import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_chat_app/models/message_model.dart';
import 'package:final_chat_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunction {
  static void signUpFunction({
    required String email,
    required String password,
    required Function emailCreated,
    required Function weakPassword,
    required Function emailExist,
    required Function onError,
  }) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      emailCreated();
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        weakPassword();
      } else if (ex.code == 'email-already-in-use') {
        emailExist();
      }
    } catch (error) {
      onError();
    }
  }

  static void signInFunction(
      {required String email,
      required String password,
      required Function loginSuccess,
      required Function loginException,
      required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      loginSuccess();
    } on FirebaseAuthException catch (ex) {
      loginException();
    } catch (error) {
      onError(error.toString());
    }
  }

  static CollectionReference<UserModel> createUsersCollection() {
    return FirebaseFirestore.instance
        .collection('Users')
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromFireStore(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.addToFireStore();
      },
    );
  }

  static void addUserToFireStore(UserModel userModel) {
    CollectionReference collection = createUsersCollection();
    var docRec = collection.doc();
    userModel.id = docRec.id;
    docRec.set(userModel);
  }

  static CollectionReference<MessageModel> createMessageCollection() {
    return FirebaseFirestore.instance
        .collection('Messages')
        .withConverter<MessageModel>(
      fromFirestore: (snapshot, options) {
        return MessageModel.fromFireStore(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.addMessageToFireStore();
      },
    );
  }

  static void sendMessageToFireStore(MessageModel messageModel) {
    var collectionRef = createMessageCollection();
    var docRef = collectionRef.doc();
    messageModel.id = docRef.id;
    docRef.set(messageModel);
  }

  static Stream<QuerySnapshot<MessageModel>> getMessageFromFireStore() {
    var collectionRef = createMessageCollection();
    return collectionRef.snapshots();
  }
}
