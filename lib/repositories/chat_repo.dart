import 'package:chat_app/data_source/remote/chat_remote_data_source.dart';
import 'package:chat_app/models/chat_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final chatRepoProvider = Provider<ChatRepo>(
  (ref) => ChatRepo(ref.read(chatRemoteProvider))
);

class ChatRepo {
  late final ChatRemoteDataSource _chatRemote;
  ChatRepo(ChatRemoteDataSource chatRemote) {
    _chatRemote = chatRemote;
  }

  Future<List<ChatModel>> getChatsByUser(String idUser) async {
    return await _chatRemote.getChatsByUser(idUser);
  }

}