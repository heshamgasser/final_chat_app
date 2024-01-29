import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  TextEditingController controller;
  String labelText;
  TextInputType textInputType;

  CustomTextFormField(
      {required this.controller,
      required this.labelText,
      required this.textInputType});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field Required';
        }
        if (textInputType == TextInputType.emailAddress) {
          final bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(value);
          if (!emailValid) {
            return 'Enter a Valid Email';
          }
        }
        if (textInputType == TextInputType.visiblePassword) {
          if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value)) {
            return 'Should Contain at Least One Upper Case Letter';
          }
          if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value)) {
            return 'Should Contain at Least One Lower Case Letter';
          }
          if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value)) {
            return 'Should Contain at Least One Number';
          }
          if (!RegExp(r'^(?=.*?[!@#\$&*~])').hasMatch(value)) {
            return 'Should Contain at Least Special Character';
          }
          if (value.length < 8) {
            return 'Must be at Least 8 Characters in Length';
          }
        }
        if (textInputType == TextInputType.text && value.length < 3) {
          return 'Enter a Valid Name';
        }
        return null;
      },
      controller: controller,
      keyboardType: textInputType,
      textInputAction: TextInputAction.next,
      obscureText:
          textInputType == TextInputType.visiblePassword ? true : false,
      style: Theme.of(context).textTheme.labelMedium,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: Colors.amberAccent),
        ),
        labelText: labelText,
        labelStyle: Theme.of(context).textTheme.labelMedium,
      ),
    );
  }
}
