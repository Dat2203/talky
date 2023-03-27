import 'package:stream_chat/stream_chat.dart';
import 'package:stream_chat_persistence/stream_chat_persistence.dart';
import 'package:talky/constant/env.dart';

class StreamChat {
  static final clinet = StreamChatClient(
    streamApiKey,
  )..chatPersistenceClient = StreamChatPersistenceClient(
      logLevel: Level.INFO,
      connectionMode: ConnectionMode.regular,


    );
}
