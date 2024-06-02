import 'dart:convert';

class Task {
  String? id;
  String title;
  String text;
  bool isActive;

  Task({
    this.id,
    required this.title,
    required this.text,
    required this.isActive,
  });

  Task copyWith({
    String? id,
    String? title,
    String? text,
    bool? isActive,
  }) {
    return Task(
      id: id ?? this.id,
      title: title ?? this.title,
      text: text ?? this.text,
      isActive: isActive ?? this.isActive,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'text': text,
      'isActive': isActive,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] != null ? map['id'] as String : null,
      title: map['title'] as String,
      text: map['text'] as String,
      isActive: map['isActive'] as bool,
    );
  }
  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) =>
      Task.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Task(id: $id,title: $title,text: $text, isActive: $isActive)';
  }

  @override
  bool operator ==(covariant Task other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.text == text &&
        other.isActive == isActive;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ text.hashCode ^ isActive.hashCode;
  }
}
