import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  UserCredential userCredential;

  LoginSuccessState(this.userCredential);
}

class LoginFailureState extends LoginStates {
  String error;

  LoginFailureState(this.error);
}
