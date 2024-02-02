import 'package:bloc/bloc.dart';
import 'package:final_chat_app/shared/styles/app_theme.dart';
import 'package:final_chat_app/views/chat_screen.dart';
import 'package:final_chat_app/views/log_in_screen.dart';
import 'package:final_chat_app/views/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'bloc_observer/bloc_observer.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(412, 870),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: LogInScreen.routeName,
          routes: {
            LogInScreen.routeName: (context) => LogInScreen(),
            SignUp.routeName: (context) => SignUp(),
            ChatScreen.routeName: (context) => ChatScreen(),
          },
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.light,
        );
      },
    );
  }
}
