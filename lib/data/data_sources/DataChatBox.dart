import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class DataChat{
  Future<String> getUserData(String username);
}

class DataChatBox{
  static const URL = 'http://127.0.0.1:8080';

  Future<String> getUsername(String username) async{
    var response = await http.get(Uri.parse('${URL}/api/user/${username}')); //body
    if(response.statusCode == 200){
      return response.body; // klo statusCode 200 nanti bakal kemabaliin isinya response body. ini nanti kembalian dari API dalam bentuk Json
    } else{
      throw Exception('Failed...');
    }
  }

    //kenapa 200? karena status berhasil di API tu 200

}

