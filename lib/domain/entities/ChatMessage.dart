class ChatMessage {
  String text;
  String id;
  String username;
  String timestamp;

  ChatMessage({
    required this.text,
    required this.id,
    required this.username,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'id': id,
      'username': username,
      'timestamp': timestamp,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      text: json['text'] ??'',
      id: json['id']?? '',
      username: json['username'] ?? '',
      timestamp: json['timestamp']?.toString() ?? '',
    );
  }
}

