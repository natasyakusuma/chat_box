import 'package:chat_box/domain/usecases/getUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatListPage extends StatefulWidget{
  late String username; //ini nanti digunakan untuk variabel yg nanti ada isinya, tp sekarang belom hehe
  ChatListPage({required this.username}); // klo chatlistpage ini nanti dipanggil dia bakal bawa variabel didalamnya

  @override

  State<StatefulWidget> createState() => _ChatListPage();
}


class _ChatListPage extends State<ChatListPage>{
  late Future<List<String>> chatRooms; //pake late karena datangnya telat jd di initialize dulu

  @override
  void initState() { // special spell untuk nampilin tampilan pertama walaupun widgetnya belom di build
    // TODO: implement initState
    super.initState(); // ini fungsi untuk ngejalanin
    chatRooms = GetUserChatList().execute(widget.username).then(
        (userData){
          return userData?.rooms ?? []; // karena ini balikinnya cuma list string
        }
    );

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Chat List'),
      ),
      body: Container(
        height: 500,
        child: FutureBuilder( // future builder wajib mengembalikan widget, satu future builder cuma bisa akses 1 API
            future: GetUserChatList().execute(widget.username),
            builder: (context, snapshot){
              if (snapshot.connectionState == ConnectionState.waiting){
                return Center(child: CircularProgressIndicator()); // makanya wajib return, liat ada viewnya
              }else if (snapshot.hasError) {
                String errorMessage = snapshot.error?.toString()??'Unknown error';
                return Center(child: Text('${errorMessage}'));
              }else if (snapshot.hasData) {
                final user = snapshot.data!; //snapshot : data dari future  builder
                final roomIds = user.rooms; // untuk get data rooms dari API
                // return (Text(user.rooms[0]));


                return ListView.builder(  // biar bentuknya kaya List View kaya WA atau spotify
                  itemCount: roomIds.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(roomIds[index]),
                    );
                  },
                );

                // iterate menggunakan indeks dari list view

                // return FutureBuilder(
                //     future: chatRooms,
                //     builder: (context, snapshot){
                //       if (snapshot.connectionState == ConnectionState.waiting){
                //         return Center(child: CircularProgressIndicator());
                //       }else if (snapshot.hasError) {
                //         String errorMessage = snapshot.error?.toString()??'Unknown error';
                //         return Center(child: Text('${errorMessage}'));
                //       }else{
                //         final roomIds = snapshot.data!;
                //         return ListView.builder(
                //           itemCount: roomIds.length,
                //           itemBuilder: (context, index){
                //             return ListTile(
                //               title: Text(roomIds[index]),
                //             );
                //           });
                //       }
                // }
                // );

              }
              else{
                return Center(child: Text('Unknown Error'));
              }
            }),

      ),
    );

  }

  }

