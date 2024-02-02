import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_chat_app/views/cubits/sign_up_cubit/sign_up_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../models/user_model.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  SignUpCubit() : super(SignUpInitialState());

  static SignUpCubit get(context) => SignUpCubit();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController fNameController = TextEditingController();

  TextEditingController lNameController = TextEditingController();

  TextEditingController confirmPasswordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey();

  CollectionReference<UserModel> createUsersCollection() {
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

  Future<void> addUserToFireStore(UserModel user) {
    var collectionRef = createUsersCollection();
    var docRef = collectionRef.doc();
    return docRef.set(user);
  }

  void signUpFunction(
      {required String firstName,
      required String lastName,
      required String email,
      required String password}) async {
    emit(SignUpLoadingState());
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
          emit(SignUpSuccessState());
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(
          SignUpFailureState(error: 'Password Provided is Too Weak'),
        );
      } else if (e.code == 'email-already-in-use') {
        emit(
          SignUpFailureState(
              error: 'An Account with Email $email Already Exists.'),
        );
      }
    } catch (e) {
      emit(
        SignUpFailureState(
          error: e.toString(),
        ),
      );
    }
  }
}
