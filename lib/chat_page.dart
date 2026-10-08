import 'dart:convert';

import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/provider/auth_service.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:chat_app/widget/chat_bubble.dart';
import 'package:chat_app/widget/chat_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import 'models/message_models.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<MessageModels> message = [];
  final ImageRepository _imageRepository = ImageRepository();
  Future<void> _loadInitialMessage() async {
    final response = rootBundle
        .loadString('assets/mock_messages.json')
        .then((response) {
          final List<dynamic> decodeJsonList = jsonDecode(response) as List;
          final List<MessageModels> _chatMessages = decodeJsonList.map((
            listItem,
          ) {
            return MessageModels.fromJson(listItem);
          }).toList();
          print('Length of the list => ${_chatMessages.length}');

          setState(() {
            message = _chatMessages;
          });
        })
        .then((_) {
          print("done");
        });
    print('something');
  }

  void onSubmitMessage(MessageModels model) {
    message.add(model);
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState

    _loadInitialMessage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userName = context.watch<AuthService>().getUserName();
    //   final userName = "mithun";
    return Scaffold(
      appBar: AppBar(
        title: Text('Hi $userName'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthService>().updateUserName('newName');
            },
            icon: Icon(Icons.update),
          ),
          IconButton(
            onPressed: () {
              context.read<AuthService>().logOutUser();
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
                  alignment:
                      message[index].author.userName ==
                          context.read<AuthService>().getUserName()
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  messageModels: message[index],
                );
              },
            ),
          ),
          ChatInput(onSubmit: onSubmitMessage),
        ],
      ),
    );
  }
}
