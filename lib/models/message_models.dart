class MessageModels {
  String id;
  String text;
  String? photoUrl;
  String sentAt;
  Author author;

  MessageModels({
    required this.id,
    required this.text,
    this.photoUrl,
    required this.sentAt,
    required this.author,
  });

  factory MessageModels.fromJson(Map<String, dynamic> json) {
    return MessageModels(
      id: json['id'],
      text: json['text'],
      photoUrl: json['image'],
      sentAt: json['createdAt'].toString(),
      author: Author.fromJson(json['author']),
    );
  }
}

class Author {
  String userName;
  Author({required this.userName});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(userName: json['username']);
  }
}
