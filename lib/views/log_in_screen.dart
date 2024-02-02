import 'package:final_chat_app/views/chat_screen.dart';
import 'package:final_chat_app/views/cubits/login_cubit/login_cubit.dart';
import 'package:final_chat_app/views/cubits/login_cubit/login_state.dart';
import 'package:final_chat_app/views/sign_up_screen.dart';
import 'package:final_chat_app/views/widgets/custom_text_form_field.dart';
import 'package:final_chat_app/views/widgets/helper_snackBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatelessWidget {
  static const String routeName = 'Log In Screen';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is LoginLoadingState) {
            const Center(child: CircularProgressIndicator());
          } else if (state is LoginSuccessState) {
            Navigator.pushReplacementNamed(context, ChatScreen.routeName,
                arguments: state.userCredential);
          } else if (state is LoginFailureState) {
            helperSnackBar(context: context, message: state.error);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: LoginCubit.get(context).formKey,
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 150.h),
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
                      SizedBox(height: 20.h),
                      Text('Sign In',
                          style: Theme.of(context).textTheme.bodyLarge),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                          controller: LoginCubit.get(context).emailController,
                          labelText: 'Email',
                          textInputType: TextInputType.emailAddress),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                          controller:
                              LoginCubit.get(context).passwordController,
                          labelText: 'Password',
                          textInputType: TextInputType.visiblePassword),
                      SizedBox(height: 20.h),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (LoginCubit.get(context)
                              .formKey
                              .currentState!
                              .validate()) {
                            LoginCubit.get(context).signIn(
                                email: LoginCubit.get(context)
                                    .emailController
                                    .text,
                                password: LoginCubit.get(context)
                                    .passwordController
                                    .text);
                            // if (state is LoginLoadingState) {
                            //   const Center(child: CircularProgressIndicator());
                            // } else if (state is LoginSuccessState) {
                            //   Navigator.pushReplacementNamed(
                            //       context, ChatScreen.routeName,
                            //       arguments: state.userCredential);
                            // } else if (state is LoginFailureState) {
                            //   helperSnackBar(
                            //       context: context, message: state.error);
                            // }

                            // SignInFunction.signIn(
                            //   emailAddress:
                            //       LoginCubit.get(context).emailController.text,
                            //   password: LoginCubit.get(context)
                            //       .passwordController
                            //       .text,
                            //   loginSuccess: (mainUser) {
                            //     Navigator.pushReplacementNamed(
                            //         context, ChatScreen.routeName,
                            //         arguments: mainUser);
                            //   },
                            //   loginException: () {
                            //     helperSnackBar(
                            //         context: context,
                            //         message:
                            //             'Your User Name or Password is Incorrect');
                            //   },
                            //   onError: (value) {
                            //     helperSnackBar(
                            //         context: context, message: value);
                            //   },
                            // );
                          }
                        },
                        child: Text(
                          'Sign In',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't Have an Account? ",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.white),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, SignUp.routeName);
                            },
                            child: Text(
                              "Sign Up",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: Colors.greenAccent),
                            ),
                          )
                        ],
                      ),
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
