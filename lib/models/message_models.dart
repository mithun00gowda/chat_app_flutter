class MessageModels {
  String id;
  String text;
  String? photoUrl;
  DateTime sentAt;
  Author author;

  MessageModels({
    required this.id,
    required this.text,
    this.photoUrl,
    required this.sentAt,
    required this.author,
  });


}

class Author {
  String userName;
  Author({required this.userName});

  factory Author.fromJson(Map<String,dynamic> json){
    return Author(userName: json['username']);
  }
}
