// class ChatRoom {
//   String id;
//   List<String> users;
//   List<Map<String, dynamic>> messages;
//
//   Chatroom({required this.id, required this.users, required this.messages});
//
//   factory ChatRoom.fromJson(Map<String, dynamic> json) { //nyocokin data
//     return ChatRoom(
//       id: json['id'],
//       users: List<String>.from(json['users']),
//       messages: List<Map<String, dynamic>>.from(json['messages']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': this.id,
//       'users': this.users,
//       'messages': this.messages,
//     };
//   }
// }
