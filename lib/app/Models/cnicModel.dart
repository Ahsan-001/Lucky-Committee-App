class ChangeCNICResponse {
  bool status;
  String message;

  ChangeCNICResponse({required this.status, required this.message});

  factory ChangeCNICResponse.fromJson(Map<String, dynamic> json) {
    return ChangeCNICResponse(
      status: json['status'],
      message: json['message'],
    );
  }
}
