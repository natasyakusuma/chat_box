class ChatMessage{
String username;
String text;
String timestamp;

ChatMessage({ required this.username, required this.text, required this.timestamp});

factory ChatMessage.fromJson(Map<String, dynamic> json){
  print('INI DARI FROM JSON CHAT MESSAGE ${json}');
  return ChatMessage(
    username: json['username'] ?? '',
    text: json['text'] ?? '',
    timestamp: json ['timestamp'] ?? '',
  );
}
}