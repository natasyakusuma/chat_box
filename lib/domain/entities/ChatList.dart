

import 'ChatMessage.dart';


class ChatList{
  List<String> users;
  List<ChatMessage> messages;
  
  ChatList({ required this.users, required this.messages});
  
  factory ChatList.fromJson(Map<String, dynamic> json){
    print(json);
    var user = <String>[];
    for(var i = 0; i < json['users'].length; i++){
      user.add(json['users'][i]); // ini bentuknya udah langsung string
      print('User $i: ${json['users'][i]}');
    }

    var message = <ChatMessage>[];
    for (var j = 0; j < json['messages'].length; j++){
      message.add(ChatMessage.fromJson(json['messages'][j])); // karena ini masih bentuk objek
      print('ChatMessage $j: ${json['messages'][j]}');
    }

    return ChatList(
    users: user,
    messages: message,
  );
    
  }
  
}