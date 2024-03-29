import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit()
      : super(
    LoginInitialState(),
  );

  static LoginCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  Future<void> signIn({required String email, required String password}) async {
    emit(LoginLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => emit(LoginSuccessState(value)));
    } on FirebaseAuthException catch (ex) {
      emit(
        LoginFailureState('Your User Name or Password is Incorrect'),
      );
    } catch (error) {
      emit(
        LoginFailureState(error.toString()),
      );
    }
  }
}
