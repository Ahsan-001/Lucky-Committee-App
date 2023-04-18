class UserProfile {
  final int id;
  final String? cnicNumber;
  final String name;
  final int type;
  final String email;
  final int state;
  final int status;
  final String city;
  final String? image;
  final int isParticipant;
  final int isClient;
  final int paymentStatus;
  final String phone;
  final String? whatsappNo;
  final String? emailVerifiedAt;
  final String createdAt;
  final String updatedAt;
  final String? deletedAt;

  UserProfile({
    required this.id,
    required this.name,
    required this.type,
    required this.email,
    required this.state,
    required this.status,
    required this.city,
    required this.isParticipant,
    required this.isClient,
    required this.paymentStatus,
    required this.phone,
    required this.createdAt,
    required this.updatedAt,
    this.cnicNumber,
    this.image,
    this.whatsappNo,
    this.emailVerifiedAt,
    this.deletedAt,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'],
      cnicNumber: json['cnic_number'],
      name: json['name'],
      type: json['type'],
      email: json['email'],
      state: json['state'],
      status: json['status'],
      city: json['city'],
      image: json['image'],
      isParticipant: json['is_participant'],
      isClient: json['is_client'],
      paymentStatus: json['payment_status'],
      phone: json['phone'],
      whatsappNo: json['whatsapp_no'],
      emailVerifiedAt: json['email_verified_at'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      deletedAt: json['deleted_at'],
    );
  }
}
