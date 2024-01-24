
import 'dart:convert';
import '../../domain/entities/User.dart';
import '../data_sources/DataChatBox.dart';

class ChatBoxRepositories{
  var dataChatBox = DataChatBox();  //manggil kelas dari data_source DataChatBox

  Future<User> getUserData(String username) async {
    var jsonResponse = jsonDecode(await dataChatBox.getUserData(username)); // getUserData disini merupakan endpoint untuk assign data mana yg ingin di decode dan di store didalam json response.
     User user = User.fromJson(jsonResponse as Map<String, dynamic>);
     return user; // added return statement

  }



}