import 'package:intl/intl.dart';

class Blog {
  int id;
  String title;
  String description;
  String image;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime? deletedAt;

  Blog({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      description: json['description'] ?? '',
      image: json['image'] ?? '',
      createdAt: DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['created_at']),
      updatedAt: DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['updated_at']),
      deletedAt: json['deleted_at'] != null
          ? DateTime.parse(json['deleted_at'])
          : null,
    );
  }
}
