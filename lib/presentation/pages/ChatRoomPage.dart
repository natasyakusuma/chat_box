import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
       // child: FutureBuilder<User>(
       //
       // ),
     ),
   );
  }

}  // ini nanti dipanggil make method yg sama kaya chatlist