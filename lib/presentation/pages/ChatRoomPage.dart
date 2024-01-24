import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatRoomPage extends StatefulWidget{
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
       child: FutureBuilder<User>(

       ),
     ),
   );
  }

}