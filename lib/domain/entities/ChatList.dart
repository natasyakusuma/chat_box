// import 'package:chat_box/domain/entities/ChatRoomPage.dart';
//
// class ChatList {
//   String username;
//   List<ChatRoom> chatrooms;
//
//   ChatList({required this.username, required this.chatrooms});
//
//   factory ChatList.fromJson(Map<String, dynamic> json) {
//     return ChatList(
//       username: json['username'],
//       chatrooms: List<ChatRoom>.from(json['chatrooms'].map((x) => ChatRoom.fromJson(x))),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'username': this.username,
//       'chatrooms': this.chatrooms.map((x) => x.toJson()).toList(),
//     };
//   }
// }
