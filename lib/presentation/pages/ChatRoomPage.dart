import 'package:chat_box/domain/usecases/getChatList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/ChatList.dart';


class ChatRoomPage extends StatefulWidget{
  final String username;
  final String id;

  ChatRoomPage({required this.username, required this.id});
  @override
  State<StatefulWidget> createState() => _ChatRoomPage();
}

class _ChatRoomPage extends State<ChatRoomPage>{



  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Chat Room'),
     ),
    body: Container(
    height: 500,
    child: FutureBuilder<ChatList>(
      future: GetListName().execute(widget.id),
        builder: (context, snapshot){
          if (snapshot.connectionState == ConnectionState.waiting){
            return Center(child: CircularProgressIndicator()); // makanya wajib return, liat ada viewnya
          }else if (snapshot.hasError) {
            String errorMessage = snapshot.error?.toString()??'Unknown error';
            return Center(child: Text('${errorMessage}'));
          }else if (snapshot.hasData) {
            final data = snapshot.data!; //snapshot : data dari future  builder
            final message = data.messages; // untuk get data rooms dari API
            // return (Text(user.rooms[0]));
            return ListView.builder(
              itemCount: message.length,
              itemBuilder: (context, index) {
                var _listUser = message[index].username;
                var _listMessage = message[index].text;
                return ListTile(
                  title: Text('${_listUser}'),
                  subtitle: Text('${_listMessage}'),
                );
              },
            );


          }
          else{
            return Center(child: Text('Unknown Error'));
          }
        }),
    ),
    );

  }

}  // ini nanti dipanggil make method yg sama kaya chatlist