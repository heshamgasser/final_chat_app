import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_chat_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpFunction {
  static CollectionReference<UserModel> createUsersCollection() {
    return FirebaseFirestore.instance
        .collection(UserModel.COLLECTION_NAME)
        .withConverter<UserModel>(
      fromFirestore: (snapshot, options) {
        return UserModel.fromFireStore(snapshot.data()!);
      },
      toFirestore: (value, options) {
        return value.addToFireStore();
      },
    );
  }

  static Future<void> addUserToFireStore(UserModel user) {
    var collectionRef = createUsersCollection();
    var docRef = collectionRef.doc();
    return docRef.set(user);
  }

  static void signUpFunction(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required Function signUpSuccess,
      required Function weakPassword,
      required Function usedEmail,
      required Function onError}) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: firstName,
          lastName: lastName,
          emailAddress: email);

      addUserToFireStore(userModel).then(
        (value) {
          signUpSuccess();
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        weakPassword();
      } else if (e.code == 'email-already-in-use') {
        usedEmail();
      }
    } catch (e) {
      onError();
    }
  }
}
