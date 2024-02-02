import 'package:final_chat_app/models/message_model.dart';
import 'package:final_chat_app/shared/network/fireBase_manager/message_function.dart';
import 'package:final_chat_app/views/widgets/chat_bubble.dart';
import 'package:final_chat_app/views/widgets/chat_text_form_field.dart';
import 'package:final_chat_app/views/widgets/friend_chat_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatScreen extends StatelessWidget {
  static const String routeName = 'Chat Screen';

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as UserCredential;

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
      body: StreamBuilder(
        stream: MessageFunction.getMessagesFromFireStore(),
        builder: (context, snapshot) {
          List<MessageModel> messages =
              snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                    reverse: true,
                    controller: scrollController,
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                    itemBuilder: (context, index) {
                      return messages[index].userId == args.user!.uid
                          ? ChatBubble(
                              message: messages[index],
                            )
                          : FriendChatBubble(
                              message: messages[index],
                            );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 20.h,
                      );
                    },
                    itemCount: messages.length),
              ),
              ChatTextFormField(
                controller: messageController,
                onSubmitted: (value) {
                  MessageModel messageModel = MessageModel(
                    userId: args.user!.uid,
                    message: value,
                    createdAt: DateTime.now(),
                  );
                  MessageFunction.addMessagesToFireStore(messageModel);
                  scrollController.animateTo(0,
                      duration: Duration(milliseconds: 5),
                      curve: Curves.fastOutSlowIn);
                  messageController.clear();
                },
                sendMessage: () {
                  MessageModel messageModel = MessageModel(
                    userId: args.user!.uid,
                    message: messageController.text,
                    createdAt: DateTime.now(),
                  );
                  MessageFunction.addMessagesToFireStore(messageModel);
                  scrollController.animateTo(0,
                      duration: Duration(milliseconds: 5),
                      curve: Curves.fastOutSlowIn);
                  messageController.clear();
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
