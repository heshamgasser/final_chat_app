import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseFunction {
  static signUpFunction(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential user = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Email Created Successfully',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    } on FirebaseAuthException catch (ex) {
      if (ex.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'The Password Provided is Too Weak',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        );
      } else if (ex.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'An Account with Email $email Already Exists.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        );
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            error.toString(),
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        ),
      );
    }
  }
}
