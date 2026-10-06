import 'package:chat_app/models/message_models.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final Alignment alignment;
  final MessageModels messageModels;
   const ChatBubble({super.key,required this.alignment, required this.messageModels} );



  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: alignment,
        child: Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey,
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
              if(messageModels.photoUrl !=  null)
                Image.network(
                messageModels.photoUrl.toString(),
                width: 200,
              ),
            ],
          ),
        ),
      );
    }
  }

