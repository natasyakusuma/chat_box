import 'dart:convert';
import '../../domain/entities/ChatList.dart';
import '../../domain/entities/User.dart';
import '../../domain/entities/ChatMessage.dart'; // Added import for Message
import '../data_sources/DataChatBox.dart';

class ChatBoxRepositories {
  var dataChatBox = DataChatBox(); //manggil kelas dari data_source DataChatBox

  Future<User> getUserData(String username) async {
    var jsonResponse = jsonDecode(await dataChatBox.getUsername(
        username))['data']; // getUsername disini merupakan endpoint yg diambil dari data source yg bentuknya string untuk assign data mana yg ingin di decode jadi object dan di store didalam json response.
    print('Server Response: $jsonResponse');

    User user = User.fromJson(jsonResponse);
    print('$user Ini dari repository');
    return user;
  }

  Future<ChatList> getListName(String id) async {
    var jsonResponse = jsonDecode(await dataChatBox.getListName(
        id))['data']; // getListname disini merupakan endpoint yg diambil dari data source yg bentuknya string untuk assign data mana yg ingin di decode jadi object dan di store didalam json response.
    print('Server Response: $jsonResponse');

    ChatList chatList = ChatList.fromJson(jsonResponse);
    print('$chatList Ini dari repository');
    return chatList;
  }

  Future<bool> createMessage(ChatMessage message) async {
    try {
      if (message.timestamp is int) {
        message.timestamp = message.timestamp.toString();
      }

      await dataChatBox.createMessage(message.toJson()); // Use dataChatBox.createMessage instead of DataChatBox.createMessage
      return true;
    } catch (e) {
      print('[REPOSITORY] Error Create Message : $e');
      return false;
    }
  }
}
