import 'package:chat_box/domain/usecases/getChatList.dart';
import 'package:chat_box/domain/usecases/getUser.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/ChatList.dart';
import 'ChatRoomPage.dart';

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

                return ListView.builder(
                  itemCount: roomIds.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 10,
                        child: FutureBuilder<ChatList>( // manggil namanya susanti dkk
                          future: GetListName().execute(roomIds[index]),
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return Center(child: CircularProgressIndicator());
                            } else if (snapshot.hasError) {
                              String errorMessage = snapshot.error?.toString() ?? 'Unknown Error';
                              return Center(child: Text('error on ChatListPage ${errorMessage}'));
                            } else if (snapshot.hasData) {
                              var _listUser = snapshot.data!.users;
                              var _listMessage = snapshot.data!.messages.last;
                              return Column(
                                children: [
                                ListTile(
                                title: Text('${_listUser[1]}'),
                                subtitle: Text('${_listMessage.text}'),
                                onTap: (){
                                  Navigator.push(context,
                                  MaterialPageRoute(
                                      builder: (context) => ChatRoomPage(
                                        id : roomIds[index],
                                        username : _listUser[1],
                                      )
                                  ),
                                  );
                            },
                                  
                            ),
                            ],

                              );

                            }
                            // Add a default case to return an empty container or some other widget
                            return Container();
                          },
                        ),
                      ),
                    );
                  },
                );


                // iterate menggunakan indeks dari list view


              }
              else{
                return Center(child: Text('Unknown Error'));
              }
            }),

      ),
    );

  }

  }

