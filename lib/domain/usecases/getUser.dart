import '../../data/repositories/ChatBoxRepositories.dart';
import '../entities/User.dart';

class GetUserChatList {
  var repository = ChatBoxRepositories();

  Future<User> execute(String username) async {
    //username disini digunakan untuk identifikasi datanya)
    try {
      return repository.getUserData(username);
    } catch (e) {
      print('$e');
      rethrow;
    }
  }
}
