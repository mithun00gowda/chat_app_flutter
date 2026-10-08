import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_screen.dart';
import 'package:chat_app/provider/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Provider(create: (_) => AuthService(),child: MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.yellow,
      ),
      home: LoginScreen(),
      routes: {
        '/chat':(context) => ChatPage(),
      },
    );
  }
}
