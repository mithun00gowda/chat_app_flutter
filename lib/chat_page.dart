import 'dart:convert';

import 'package:chat_app/widget/chat_bubble.dart';
import 'package:chat_app/widget/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'models/message_models.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageModels> message = [];
  Future<void> _loadInitialMessage() async {
    final response = await rootBundle.loadString('assets/mock_messages.json');

    final List<dynamic> decodeJsonList = jsonDecode(response) as List;

    final List<MessageModels> _chatMessages = decodeJsonList.map((listItem) {
      return MessageModels.fromJson(listItem);
    }).toList();

    print('Length of the list => ${_chatMessages.length}');

    setState(() {
      message = _chatMessages;
    });
    // print(response);
  }

  @override
  void initState() {
    // TODO: implement initState

    _loadInitialMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userName = ModalRoute.of(context)!.settings.arguments;

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
