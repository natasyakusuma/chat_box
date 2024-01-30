import 'package:chat_box/data/data_sources/DataChatBox.dart';
import 'package:chat_box/domain/entities/ChatMessage.dart';
import 'package:chat_box/domain/usecases/getChatList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/ChatList.dart';
import '../../domain/usecases/createChatMessage.dart';

class ChatRoomPage extends StatefulWidget {
  final String username;
  final String id;

  ChatRoomPage({required this.username, required this.id});

  @override
  State<StatefulWidget> createState() => _ChatRoomPage();
}

class _ChatRoomPage extends State<ChatRoomPage> {
  TextEditingController _messageController = TextEditingController(); // Controller for the message input field (untuk input text)
  late String _listSender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.username}'),
        backgroundColor: const Color(0xFF007AFF),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder<ChatList>(
                future: GetListName().execute(widget.id),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    String errorMessage =
                        snapshot.error?.toString() ?? 'Unknown error';
                    return Center(child: Text('${errorMessage}'));
                  } else if (snapshot.hasData) {
                    final data = snapshot.data!;
                    final message = data.messages;

                    return ListView.builder(
                      itemCount: message.length,
                      itemBuilder: (context, index) {
                        var _listUser = message[index].username;
                        var _listMessage = message[index].text;

                        bool isCurrentUser = _listUser == widget.username;
                        _listSender = message[0].username;

                        return Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Align(
                            alignment: isCurrentUser
                                ? Alignment.centerLeft
                                : Alignment.centerRight,
                            child: Container(
                              padding: EdgeInsets.all(12.0),
                              decoration: BoxDecoration(
                                color:
                                    isCurrentUser ? Colors.grey : Colors.blue,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${_listUser}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '${_listMessage}',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return Center(child: Text('Unknown Error'));
                  }
                },
              ),
            ),
          ),
          // Input field and send button
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Pesan Anda',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    sendMessage(_messageController.text, _listSender);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void sendMessage(String _inputMessage, _listSender) async {
    String id = widget.id;
    print('ID ROOM : ${id}');
    String text = _messageController.text;
    print('MESSAGE : ${_messageController}');
    String username = _listSender;
    print('USERNAME : ${username}');
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    print('TIMESTAMP : ${timestamp}');

    final sendMessage = CreateMessage(); // variabel yg menerima kelas createMessage dari use case

    ChatMessage newMessage = ChatMessage(text: text, id: id, username: username, timestamp: timestamp);

    try {
      await sendMessage.execute(newMessage); // Fix: Call the execute method on an instance of CreateMessage
      _messageController
          .clear(); // Update chatRoomData after sending a new message
      setState(() {
        DataChatBox().getListName(
            id); // Fix: Call the method getListName to fetch the updated data
      });
    } catch (e) {
      // Handle exception
      print('Error sending message: $e');
    }
  }
}
