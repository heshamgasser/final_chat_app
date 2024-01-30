import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/styles/app_color.dart';

class ChatTextFormField extends StatelessWidget {
  const ChatTextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: TextFormField(
        style: Theme.of(context)
            .textTheme
            .labelMedium!
            .copyWith(color: AppColors.backgrounColor),
        decoration: InputDecoration(
            hintText: 'Send Message',
            hintStyle: Theme.of(context)
                .textTheme
                .labelMedium!
                .copyWith(color: AppColors.backgrounColor),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: Colors.black),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: Colors.black),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.r),
              borderSide: BorderSide(color: Colors.black),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.send,
                size: 30.r,
                color: AppColors.backgrounColor,
              ),
            )),
      ),
    );
  }
}
