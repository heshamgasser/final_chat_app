import 'package:final_chat_app/models/message_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FriendChatBubble extends StatelessWidget {
  MessageModel message;

  FriendChatBubble({required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        decoration: BoxDecoration(
          color: Colors.greenAccent,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.r),
            topLeft: Radius.circular(20.r),
            bottomLeft: Radius.circular(20.r),
          ),
        ),
        child: Text(
          message.message,
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
