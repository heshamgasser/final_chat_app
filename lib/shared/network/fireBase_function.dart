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
}
