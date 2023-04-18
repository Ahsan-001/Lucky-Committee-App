import 'dart:convert';

Register registerFromJson(String str) => Register.fromJson(json.decode(str));

String registerToJson(Register data) => json.encode(data.toJson());

class Register {
  Register({
    required this.status,
    required this.user,
    required this.token,
  });

  bool status;
  User user;
  String token;

  factory Register.fromJson(Map<String, dynamic> json) => Register(
        status: json["status"],
        user: User.fromJson(json["user"]),
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "user": user.toJson(),
        "token": token,
      };
}

class User {
  User({
    required this.id,
    this.cnicNumber,
    required this.name,
    required this.type,
    required this.email,
    required this.state,
    required this.status,
    required this.city,
    this.image,
    required this.isParticipant,
    required this.isClient,
    required this.paymentStatus,
    required this.phone,
    this.whatsappNo,
    this.emailVerifiedAt,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });

  int id;
  dynamic cnicNumber;
  String name;
  int type;
  String email;
  int state;
  int status;
  String city;
  dynamic image;
  int isParticipant;
  int isClient;
  int paymentStatus;
  String phone;
  dynamic whatsappNo;
  dynamic emailVerifiedAt;
  String createdAt;
  DateTime updatedAt;
  dynamic deletedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        cnicNumber: json["cnic_number"],
        name: json["name"],
        type: json["type"],
        email: json["email"],
        state: json["state"],
        status: json["status"],
        city: json["city"],
        image: json["image"],
        isParticipant: json["is_participant"],
        isClient: json["is_client"],
        paymentStatus: json["payment_status"],
        phone: json["phone"],
        whatsappNo: json["whatsapp_no"],
        emailVerifiedAt: json["email_verified_at"],
        createdAt: json["created_at"],
        updatedAt: DateTime.parse(json["updated_at"]),
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "cnic_number": cnicNumber,
        "name": name,
        "type": type,
        "email": email,
        "state": state,
        "status": status,
        "city": city,
        "image": image,
        "is_participant": isParticipant,
        "is_client": isClient,
        "payment_status": paymentStatus,
        "phone": phone,
        "whatsapp_no": whatsappNo,
        "email_verified_at": emailVerifiedAt,
        "created_at": createdAt,
        "updated_at": updatedAt.toIso8601String(),
        "deleted_at": deletedAt,
      };
}
