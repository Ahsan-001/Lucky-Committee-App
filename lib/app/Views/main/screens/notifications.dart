import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Home/democard.dart';

class NotificationModel {
  final int id;
  final int userId;
  final String message;
  final String image;
  final int isRead;
  final DateTime createdAt;
  final DateTime updatedAt;

  NotificationModel({
    required this.id,
    required this.userId,
    required this.message,
    required this.image,
    required this.isRead,
    required this.createdAt,
    required this.updatedAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      id: json['id'],
      userId: json['user_id'],
      message: json['message'],
      image: json['image'] ?? '',
      isRead: json['is_read'],
      createdAt: DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['created_at']),
      updatedAt: DateFormat("yyyy-MM-dd HH:mm:ss").parse(json['updated_at']),
    );
  }
}

class NotificationsView extends StatefulWidget {
  final String token;

  NotificationsView({required this.token});

  @override
  State<NotificationsView> createState() => _NotificationsViewState();
}

class _NotificationsViewState extends State<NotificationsView> {
  List<NotificationModel> notifications = [];

  @override
  void initState() {
    super.initState();
    fetchNotifications();
  }

  Future<void> fetchNotifications() async {
    var response = await http.get(
      Uri.parse('https://perpaycommittee.com/api/notifications'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.token}',
      },
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(response.body);
      setState(() {
        notifications = List<NotificationModel>.from(
          data['notifications'].map(
            (notification) => NotificationModel.fromJson(notification),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[kBrownColor, kMainColor2]),
          ),
        ),
        // title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperOne(
              flip: true,
            ),
            child: Container(
              width: double.infinity,
              height: 140,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [kBrownColor, kMainColor2],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Notifications",
                  textAlign: TextAlign.center,
                  style: h25HeadingWhiteBold,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const Divider(
                  height: 0,
                );
              },
              itemCount: notifications.length,
              itemBuilder: (context, index) {
                var notification = notifications[index];
                return Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey.shade300,
                        ),
                        child: const Icon(
                          Icons.notifications,
                          color: kBlueColor,
                          size: 25,
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(left: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                notification.message,
                                style: h16HeadingBlackBold,
                              ),
                              Container(
                                margin: const EdgeInsets.only(top: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      DateFormat('yyyy-MM-dd')
                                          .format(notification.createdAt),
                                      style: h11HeadingBlackSimple.copyWith(
                                          color: kDarkLightColor),
                                    ),
                                    Text(
                                      DateFormat('hh:mm a')
                                          .format(notification.createdAt),
                                      style: h11HeadingBlackSimple.copyWith(
                                          color: kDarkLightColor),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
                ;
              },
            ),
          ),
        ],
      ),
    );
  }
}
