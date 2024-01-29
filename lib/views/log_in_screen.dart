import 'package:final_chat_app/shared/styles/app_color.dart';
import 'package:final_chat_app/shared/styles/app_text.dart';
import 'package:final_chat_app/views/sign_up_screen.dart';
import 'package:final_chat_app/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogIn extends StatelessWidget {
  static const String routeName = 'Log In Screen';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
              Text('Sign In', style: Theme.of(context).textTheme.bodyLarge),
              SizedBox(height: 20.h),
              CustomTextFormField(
                  controller: emailController,
                  labelText: 'Email',
                  textInputType: TextInputType.emailAddress),
              SizedBox(height: 20.h),
              CustomTextFormField(
                  controller: passwordController,
                  labelText: 'Password',
                  textInputType: TextInputType.visiblePassword),
              SizedBox(height: 20.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
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
                      Navigator.pushReplacementNamed(context, SignUp.routeName);
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
    );
  }
}