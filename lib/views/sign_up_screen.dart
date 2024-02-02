import 'package:final_chat_app/shared/network/fireBase_manager/sign_up_function.dart';
import 'package:final_chat_app/views/chat_screen.dart';
import 'package:final_chat_app/views/cubits/sign_up_cubit/sign_up_cubit.dart';
import 'package:final_chat_app/views/cubits/sign_up_cubit/sign_up_state.dart';
import 'package:final_chat_app/views/log_in_screen.dart';
import 'package:final_chat_app/views/widgets/custom_text_form_field.dart';
import 'package:final_chat_app/views/widgets/helper_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  static const String routeName = 'Sign Up Screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(),
      child: BlocConsumer<SignUpCubit, SignUpStates>(
        listener: (context, state) {
          if (state is SignUpLoadingState) {
            Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is SignUpSuccessState) {
            Navigator.pushReplacementNamed(context, LogInScreen.routeName);
          } else if (state is SignUpFailureState) {
            helperSnackBar(context: context, message: state.error);
          }
        },
        builder: (context, state) {
          var signUpBloc = BlocProvider.of<SignUpCubit>(context, listen: true);

          return Scaffold(
            appBar: AppBar(
              leading: BackButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(
                      context, LogInScreen.routeName);
                },
              ),
            ),
            body: Form(
              key: signUpBloc.formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: 150.w,
                        height: 150.h,
                        child: Image.asset(
                          'assets/images/scholar.png',
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Center(
                        child: Text(
                          'Scholar Chat',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text('Sign Up',
                          style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'First Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: Text(
                              'Last Name',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                                controller: signUpBloc.fNameController,
                                labelText: 'First Name',
                                textInputType: TextInputType.text),
                          ),
                          SizedBox(width: 10.w),
                          Expanded(
                            child: CustomTextFormField(
                                controller: signUpBloc.lNameController,
                                labelText: 'Last Name',
                                textInputType: TextInputType.text),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                          controller: signUpBloc.emailController,
                          labelText: 'Email',
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                          controller: signUpBloc.passwordController,
                          labelText: 'Password',
                          textInputType: TextInputType.visiblePassword),
                      SizedBox(height: 10.h),
                      CustomTextFormField(
                          controller: signUpBloc.confirmPasswordController,
                          labelText: 'Confirm Password',
                          textInputType: TextInputType.visiblePassword),
                      SizedBox(height: 10.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (signUpBloc.formKey.currentState!.validate()) {
                            signUpBloc.signUpFunction(
                              firstName: signUpBloc.fNameController.text,
                              lastName: signUpBloc.lNameController.text,
                              email: signUpBloc.emailController.text,
                              password: signUpBloc.passwordController.text,
                            );

                            // SignUpFunction.signUpFunction(
                            //   firstName: fNameController.text,
                            //   lastName: lNameController.text,
                            //   email: emailController.text,
                            //   password: passwordController.text,
                            //   signUpSuccess: () {
                            //     helperSnackBar(
                            //         context: context,
                            //         message: 'Email Created Successfully');
                            //     Navigator.pushReplacementNamed(
                            //         context, ChatScreen.routeName);
                            //     Navigator.pushReplacementNamed(
                            //         context, LogIn.routeName);
                            //   },
                            //   weakPassword: () {
                            //     helperSnackBar(
                            //         context: context,
                            //         message: 'Email Created Successfully');
                            //     Navigator.pushReplacementNamed(
                            //         context, ChatScreen.routeName);
                            //   },
                            //   usedEmail: () {
                            //     helperSnackBar(
                            //         context: context,
                            //         message:
                            //         'An Account with Email ${emailController
                            //             .text} Already Exists.');
                            //   },
                            //   onError: () {
                            //     helperSnackBar(
                            //         context: context,
                            //         message: 'Something Went Wrong');
                            //   },
                            // );
                          }
                        },
                        child: Text(
                          'Sign Up',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already Have an Account? ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, LogInScreen.routeName);
                            },
                            child: Text(
                              "Sign In",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.greenAccent),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
