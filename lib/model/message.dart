class MessageModel{
    String? content;
    String? reciverId;
    String? senderId;
    bool? isSeen;
    DateTime? createdAt;

    MessageModel({this.content, this.reciverId, this.senderId, this.isSeen, this.createdAt});

}