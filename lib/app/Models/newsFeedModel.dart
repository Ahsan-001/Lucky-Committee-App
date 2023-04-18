import 'package:intl/intl.dart';

class NewsFeed {
  int id;
  String title;
  String description;
  int status;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  NewsFeed({
    required this.id,
    required this.title,
    required this.description,
    required this.status,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory NewsFeed.fromJson(Map<String, dynamic> json) {
    return NewsFeed(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      image: json['image'] ?? '',
      createdAt: DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']).toLocal(),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }
}
