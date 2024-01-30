import 'package:chat_box/data/repositories/ChatBoxRepositories.dart';
import 'package:chat_box/domain/entities/ChatMessage.dart';

class CreateMessage {
  var _repositories = ChatBoxRepositories();

  Future<bool> execute(ChatMessage message) async{
    return _repositories.createMessage(message);
  }
}