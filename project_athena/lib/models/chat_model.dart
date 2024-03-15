import 'dart:convert';

class ChatModel {
  final String id;
  final String message;
  final bool isMe;
  ChatModel({
    required this.id,
    required this.message,
    required this.isMe,
  });

  ChatModel copyWith({
    String? id,
    String? message,
    bool? isMe,
  }) {
    return ChatModel(
      id: id ?? this.id,
      message: message ?? this.message,
      isMe: isMe ?? this.isMe,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'message': message,
      'isMe': isMe,
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'] as String,
      message: map['message'] as String,
      isMe: map['isMe'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ChatModel(id: $id, message: $message, isMe: $isMe)';

  @override
  bool operator ==(covariant ChatModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.message == message && other.isMe == isMe;
  }

  @override
  int get hashCode => id.hashCode ^ message.hashCode ^ isMe.hashCode;
}
