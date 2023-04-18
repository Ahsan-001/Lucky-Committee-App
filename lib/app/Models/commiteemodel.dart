import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

CommitteeShow committeeShowFromJson(String str) =>
    CommitteeShow.fromJson(json.decode(str));

String committeeShowToJson(CommitteeShow data) => json.encode(data.toJson());

class CommitteeShow {
  CommitteeShow({
    required this.status,
    required this.committees,
  });

  bool status;
  List<Committee> committees;

  factory CommitteeShow.fromJson(Map<String, dynamic> json) => CommitteeShow(
        status: json["status"],
        committees: List<Committee>.from(
            json["committees"].map((x) => Committee.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "committees": List<dynamic>.from(committees.map((x) => x.toJson())),
      };
}

class Committee {
  Committee({
    required this.id,
    required this.name,
    required this.image,
    required this.prize,
    required this.expiryDate,
    required this.announcementDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.products,
  });

  int id;
  String name;
  String image;
  int prize;
  DateTime expiryDate;
  DateTime announcementDate;
  int status;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;
  List<Product> products;

  factory Committee.fromJson(Map<String, dynamic> json) => Committee(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        prize: json["prize"],
        expiryDate: DateTime.parse(json["expiry_date"]),
        announcementDate: DateTime.parse(json["announcement_date"]),
        status: json["status"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "prize": prize,
        "expiry_date":
            "${expiryDate.year.toString().padLeft(4, '0')}-${expiryDate.month.toString().padLeft(2, '0')}-${expiryDate.day.toString().padLeft(2, '0')}",
        "announcement_date":
            "${announcementDate.year.toString().padLeft(4, '0')}-${announcementDate.month.toString().padLeft(2, '0')}-${announcementDate.day.toString().padLeft(2, '0')}",
        "status": status,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.shortDescription,
    required this.price,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  String title;
  String image;
  String shortDescription;
  String price;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        image: json["image"],
        shortDescription: json["short_description"],
        price: json["price"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
        "short_description": shortDescription,
        "price": price,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "deleted_at": deletedAt,
      };
}
