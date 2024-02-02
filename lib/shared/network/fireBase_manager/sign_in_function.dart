import 'package:firebase_auth/firebase_auth.dart';

class SignInFunction {
  static void signIn(
      {required String emailAddress,
      required String password,
      required Function loginSuccess,
      required Function loginException,
      required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);

      loginSuccess(credential);
    } on FirebaseAuthException catch (ex) {
      loginException();
    } catch (error) {
      onError(error.toString());
    }
  }
}
