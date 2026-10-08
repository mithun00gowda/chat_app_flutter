import 'package:chat_app/models/message_models.dart';
import 'package:chat_app/widget/network_image_picker_body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/auth_service.dart';

class ChatInput extends StatefulWidget {
  final Function(MessageModels) onSubmit;

  ChatInput({super.key, required this.onSubmit});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImageUrl = '';

  final _messageController = TextEditingController();

  void sendMessage() {
    print(_messageController.text);

    final newChatMessage = MessageModels(
      id: "244",
      text: _messageController.text,
      sentAt: DateTime.now().millisecondsSinceEpoch.toString(),

      author: Author(userName: context.read<AuthService>().getUserName()),
    );

    if (_selectedImageUrl.isNotEmpty) {
      newChatMessage.photoUrl = _selectedImageUrl;
    }

    widget.onSubmit(newChatMessage);
    _messageController.clear();
    _selectedImageUrl = '';
    setState(() {});
  }

  void onImagePicked(String newImageUrl) {
    setState(() {
      _selectedImageUrl = newImageUrl;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Colors.black54,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        children: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return NetworkImagePickerBody(onImageSelected: onImagePicked);
                },
              );
            },
            icon: Icon(Icons.add, color: Colors.white),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: .start,
              children: [
                TextField(
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  minLines: 1,
                  textCapitalization: TextCapitalization.sentences,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Type your message here',
                    hintStyle: TextStyle(color: Colors.grey),
                  ),
                  controller: _messageController,
                ),
                if (_selectedImageUrl.isNotEmpty)
                  Expanded(child: Image.network(_selectedImageUrl, width: 50)),
              ],
            ),
          ),
          IconButton(
            onPressed: sendMessage,
            icon: Icon(Icons.send, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
