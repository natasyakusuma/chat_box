import 'dart:convert';
import 'package:http/http.dart' as http;


abstract class DataChat {
  Future<String> getUserData(String username);

  Future<String> getListName(String id);
}

class DataChatBox {
  static const URL = 'http://127.0.0.1:8080';

  Future<String> getUsername(String username) async {
    try {
      var response =
      await http.get(Uri.parse('${URL}/api/user/${username}')); //body
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to get username data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error getting username data: $e');
      throw e;
    }
  }

  Future<String> getListName(String id) async {
    try {
      var response = await http.get(Uri.parse('${URL}/api/chat/${id}')); //body
      print('ini datasource getListName ${response.body}');
      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception('Failed to get list name. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error getting list name: $e');
      throw e;
    }
  }

  Future<void> createMessage(Map<String, dynamic> message) async {
    try {
      final response = await http.post(
        Uri.parse('${URL}/api/chat'), // ini untuk post data ke end point
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'text': message['text'],
          'id': message['id'],
          'username': message['username'],
          'timestamp': message['timestamp'].toString(),
        }),
      );

      print('RESPONSE CREATE MESSAGE FROM DATA SOURCE : ${response.statusCode}');

      if (response.statusCode == 200) {
        print('Message sent successfully');
      } else {
        print('Failed to send message. Error code: ${response.statusCode}');
        throw Exception('Failed to send message. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending message: $e');
      throw e;
    }
  }
}
