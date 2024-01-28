import 'package:final_chat_app/shared/styles/app_color.dart';
import 'package:final_chat_app/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class LogIn extends StatelessWidget {
  static const String routeName = 'Log In Screen';

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgrounColor,
      body: Padding(
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
                style: GoogleFonts.pacifico(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
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
                style: GoogleFonts.poppins(
                    fontSize: 16.sp, color: AppColors.backgrounColor),
              ),
            ),
            SizedBox(height: 10.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don't Have an Account? ",
                  style:
                      GoogleFonts.poppins(fontSize: 14.sp, color: Colors.white),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.poppins(
                      fontSize: 14.sp,
                      color: Colors.greenAccent,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
