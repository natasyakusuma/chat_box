import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget{
  late String username; //ini nanti digunakan untuk variabel yg nanti ada isinya, tp sekarang belom hehe
  ChatListPage({required this.username}); // klo chatlistpage ini nanti dipanggil dia bakal bawa variabel didalamnya

  @override

  State<StatefulWidget> createState() => _ChatListPage();
}


class _ChatListPage extends State<ChatListPage>{
  late Future<Map<String, dynamic>> chatRooms; //

  @override
  void initState() { // special spell untuk nampilin tampilan pertama
    // TODO: implement initState
    super.initState();
    chatRooms =
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List'),
      ),
      body: Container(
        height: 500,
        child: FutureBuilder(),
      ),
    );

  }

  }

