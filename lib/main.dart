import 'package:chat_app/chat_page.dart';
import 'package:chat_app/login_screen.dart';
import 'package:chat_app/provider/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AuthService.init();
  runApp(
    ChangeNotifierProvider(
      create: (BuildContext context) => AuthService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.yellow),
      home: FutureBuilder(
        future: context.read<AuthService>().isLoggedIn(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData && snapshot.data!){
              return ChatPage();
            }
            return LoginScreen();
          }

          return CircularProgressIndicator();
        },
      ),
      routes: {'/chat': (context) => ChatPage()},
    );
  }
}
