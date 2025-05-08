import 'package:uuid/uuid.dart';

class AppUser {
  late String id; // 유저 ID
  final String name; // 유저 이름
  DateTime createdAt; // 생성일시

  // 생성자
  AppUser({
    String? id,
    required this.name,
    DateTime? createdAt,
  })  : id = id ?? _generateId(),
        createdAt = createdAt ?? DateTime.now();

  // ID 생성 함수
  static String _generateId() {
    return Uuid().v4();
  }

  // JSON 변환 함수
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toUtc().toIso8601String(), // UTC -> KST
    };
  }

  // JSON을 객체로 변환하는 팩토리 메서드
  factory AppUser.fromJson(Map<String, dynamic> json) {
    return AppUser(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']).toLocal(), // UTC -> KST
    );
  }
}
