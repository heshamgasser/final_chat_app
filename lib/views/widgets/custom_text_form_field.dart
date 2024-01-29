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
