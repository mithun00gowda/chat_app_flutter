import 'package:chat_app/widget/chat_bubble.dart';
import 'package:chat_app/widget/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/message_models.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});


  _loadInitialMessage() async {
    final response =await rootBundle.loadString('assets/mock_messages.json');
    print(response);
  }
  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments;
    _loadInitialMessage();
    final message = [
      MessageModels(
        id: '1234',
        text: 'Hi i AM Mithun',
        sentAt: DateTime.now(),
        photoUrl: 'https://neilpatel.com/wp-content/uploads/2019/08/google.jpg',
        author: Author(userName: '$userName'),
      ),
      MessageModels(
        id: '1235',
        text: 'Hi im Sachin',
        sentAt: DateTime.now(),
        author: Author(userName: 'sachin'),
      ),
      MessageModels(
        id: '1236',
        text: 'where are u',
        sentAt: DateTime.now(),
        author: Author(userName: 'sachin'),
      ),
      MessageModels(
        id: '1237',
        text: 'i m coming wait for me ',
        photoUrl: 'https://neilpatel.com/wp-content/uploads/2019/08/google.jpg',
        sentAt: DateTime.now(),
        author: Author(userName: '$userName'),
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $userName'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/');
            },
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            //create a dynamic sized list
            child: ListView.builder(
              itemCount: message.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  alignment: message[index].author.userName == 'mithun'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  messageModels: message[index],
                );
              },
            ),
          ),
          ChatInput(),
        ],
      ),
    );
  }
}
