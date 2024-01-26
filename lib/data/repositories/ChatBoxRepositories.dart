
import 'dart:convert';
import '../../domain/entities/ChatList.dart';
import '../../domain/entities/User.dart';
import '../data_sources/DataChatBox.dart';

class ChatBoxRepositories{
  var dataChatBox = DataChatBox();  //manggil kelas dari data_source DataChatBox

    Future<User> getUserData(String username) async {
      var jsonResponse = jsonDecode(await dataChatBox.getUsername(username))['data']; // getUsername disini merupakan endpoint yg diambil dari data source yg bentuknya string untuk assign data mana yg ingin di decode jadi object dan di store didalam json response.
      print('Server Response: $jsonResponse');
      // if (jsonResponse != null) {
      //   User user = User.fromJson(jsonResponse); //ini object diubah menjadi json
      //   //kenapa pake map karena isinya 2, Key dan Valuenya
      //   print('$user Ini dari repository');
      //   return user;
      // } else {
      //   // Handle the case where the server response is null.
      //   print('Error: jsonResponse is null');
      //   return User(username: '', rooms: []); // added return// statement
      // }


      User user = User.fromJson(jsonResponse);
      print('${user} Ini dari repository');
      return user;
    }

  Future<ChatList> getListName(String id) async {
    var jsonResponse = jsonDecode(await dataChatBox.getListName(id))['data']; // getListname disini merupakan endpoint yg diambil dari data source yg bentuknya string untuk assign data mana yg ingin di decode jadi object dan di store didalam json response.
    print('Server Response: $jsonResponse');

    ChatList chatList = ChatList.fromJson(jsonResponse);
    print('${chatList} Ini dari repository');
    return chatList;
  }
  }
