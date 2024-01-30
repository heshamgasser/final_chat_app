import 'package:final_chat_app/shared/styles/app_color.dart';
import 'package:final_chat_app/views/widgets/chat_bubble.dart';
import 'package:final_chat_app/views/widgets/chat_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = 'Chat Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/scholar.png',
              height: 75.h,
            ),
            SizedBox(width: 5.w),
            Text(
              'Chat',
              style: Theme.of(context).textTheme.bodyLarge,
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                itemBuilder: (context, index) {
                  return ChatBubble();
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 20.h,
                  );
                },
                itemCount: 20),
          ),
          ChatTextFormField(),
        ],
      ),
    );
  }
}
