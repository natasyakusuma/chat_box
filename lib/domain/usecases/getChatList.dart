import '../../data/repositories/ChatBoxRepositories.dart';
import '../entities/ChatList.dart';

class GetListName{
  var repository = ChatBoxRepositories();

  Future<ChatList> execute(String id) async{  //username disini digunakan untuk identifikasi datanya)
       return repository.getListName(id);
  }
}