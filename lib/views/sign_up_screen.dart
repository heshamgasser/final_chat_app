import 'package:final_chat_app/shared/styles/app_color.dart';
import 'package:final_chat_app/shared/styles/app_text.dart';
import 'package:final_chat_app/views/log_in_screen.dart';
import 'package:final_chat_app/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUp extends StatelessWidget {
  static const String routeName = 'Sign Up Screen';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fNameController = TextEditingController();
  TextEditingController lNameController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, LogIn.routeName);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
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
              Text('Sign Up', style: Theme.of(context).textTheme.bodyLarge),
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
                        controller: fNameController,
                        labelText: 'First Name',
                        textInputType: TextInputType.text),
                  ),
                  SizedBox(width: 10.w),
                  Expanded(
                    child: CustomTextFormField(
                        controller: lNameController,
                        labelText: 'Last Name',
                        textInputType: TextInputType.text),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CustomTextFormField(
                  controller: emailController,
                  labelText: 'Email',
                  textInputType: TextInputType.emailAddress),
              SizedBox(height: 10.h),
              CustomTextFormField(
                  controller: passwordController,
                  labelText: 'Password',
                  textInputType: TextInputType.visiblePassword),
              SizedBox(height: 10.h),
              CustomTextFormField(
                  controller: passwordController,
                  labelText: 'Confirm Password',
                  textInputType: TextInputType.visiblePassword),
              SizedBox(height: 10.h),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                ),
                onPressed: () {},
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
                      Navigator.pushReplacementNamed(context, LogIn.routeName);
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
    );
  }
}
