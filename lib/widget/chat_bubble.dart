import 'package:chat_app/models/message_models.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_service.dart';

class ChatBubble extends StatelessWidget {
  final Alignment alignment;
  final MessageModels messageModels;
  ChatBubble({super.key, required this.alignment, required this.messageModels});
  @override
  Widget build(BuildContext context) {
    bool isAuthor =
        messageModels.author.userName ==
        context.read<AuthService>().getUserName();
    print('${messageModels.author.userName} and ${context.read<AuthService>().getUserName()}');
    print(isAuthor);
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.6,
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isAuthor ? Colors.grey : Colors.blueAccent,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(messageModels.text, style: TextStyle(fontSize: 20)),
            if (messageModels.photoUrl != null)
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: NetworkImage(messageModels.photoUrl!),
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
