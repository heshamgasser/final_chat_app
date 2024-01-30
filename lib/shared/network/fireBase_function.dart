import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

  static void SignInFunction(
      {required String email,
      required String password,
      required Function userNotFound,
      required Function wrongPassword,
      required Function onError}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'user-not-found') {
        userNotFound();
      } else if (ex.code == 'wrong-password') {
        wrongPassword();
      }
    } catch (error) {
      onError();
    }
  }
}
