abstract class SignUpStates {}

class SignUpInitialState extends SignUpStates {}

class SignUpLoadingState extends SignUpStates {}

class SignUpSuccessState extends SignUpStates {}

class SignUpFailureState extends SignUpStates {
  String error;

  SignUpFailureState({required this.error});
}
