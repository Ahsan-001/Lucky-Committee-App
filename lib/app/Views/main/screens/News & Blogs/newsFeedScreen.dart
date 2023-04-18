import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:lucky_committee/app/Controllers/newsfeed_controller.dart';
import 'package:lucky_committee/app/Models/blogModel.dart';
import 'package:lucky_committee/app/Models/newsFeedModel.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/main/screens/Home/democard.dart';
import 'package:lucky_committee/app/Views/main/screens/News%20&%20Blogs/addnewsFeed.dart';
import 'package:lucky_committee/app/Views/main/screens/News%20&%20Blogs/blogsDetail.dart';
import 'package:lucky_committee/app/Widgets/blogsCard.dart';

class NewsFeedScreen extends StatelessWidget {
  final controller = Get.put(NewsFeedController());
  final String token;
  NewsFeedScreen({super.key, required this.token});
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
        key: scaffoldKey,
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: WaveClipperOne(
                    flip: true,
                  ),
                  child: Container(
                    height: 140,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [kBrownColor, kMainColor2],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    width: 300,
                    height: 50,
                    child: TabBar(
                      labelColor: kWhiteColor,
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      indicatorColor: kWhiteColor,
                      indicatorWeight: 3.0,
                      controller: controller.tabController,
                      tabs: [
                        Tab(
                          text: 'NewsFeeds',
                        ),
                        Tab(
                          text: 'Blogs',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                child: TabBarView(
                  controller: controller.tabController,
                  children: [
                    NewsFeedSection(
                      token: token,
                    ),
                    BlogsSection(
                      token: token,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}

class BlogsSection extends StatefulWidget {
  final String token;
  BlogsSection({super.key, required this.token});

  @override
  State<BlogsSection> createState() => _BlogsSectionState();
}

class _BlogsSectionState extends State<BlogsSection> {
  Future<List<Blog>>? _futureBlogs;

  @override
  List<Blog> _blogs = [];

  Future<void> _fetchBlogs() async {
    final response = await http.get(
      Uri.parse('https://perpaycommittee.com/api/blogs'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.token}',
      },
    );
    final jsonData = json.decode(response.body);
    setState(() {
      _blogs = (jsonData['blogs'] as List)
          .map((json) => Blog.fromJson(json))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchBlogs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder(
            future: _futureBlogs,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else {
                return ListView.builder(
                  itemCount: _blogs.length,
                  itemBuilder: (context, index) {
                    final blog = _blogs[index];
                    return BlogsCard(
                      ontap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => BlogsDetail(
                            blog: blog,
                          ),
                        ),
                      ),
                      title: blog.title,
                      subtitle: blog.description
                          .replaceAll(
                            '<p>',
                            '',
                          )
                          .replaceAll('</p>', ''),
                      img: Container(
                        height: 70,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.fitHeight,
                              image: blog.image.isNotEmpty
                                  ? NetworkImage(
                                      'https://perpaycommittee.com/${blog.image}')
                                  : const NetworkImage(
                                      'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png')),
                        ),
                      ),
                      time: timeago.format(blog.createdAt),
                    );
                  },
                );
              }
            }));
  }
}

class NewsFeedSection extends StatefulWidget {
  const NewsFeedSection({super.key, required this.token});
  final String token;
  @override
  State<NewsFeedSection> createState() => _NewsFeedSectionState();
}

class _NewsFeedSectionState extends State<NewsFeedSection> {
  List<Blog> _newsFeed = [];
  Future<List<NewsFeed>>? _newsFeeds;
  Future<void> _getNewsFeed() async {
    final response = await http.get(
      Uri.parse('https://perpaycommittee.com/api/news_feeds'),
      headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer ${widget.token}',
      },
    );
    final jsonData = json.decode(response.body);
    setState(() {
      _newsFeed = (jsonData['news_feeds'] as List)
          .map((json) => Blog.fromJson(json))
          .toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _getNewsFeed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        heroTag: "btn1",
        backgroundColor: kOrangeColor,
        child: Container(
            width: 60,
            height: 60,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffFD4F0E), Color(0xffFF9A0A)],
              ),
            ),
            child: const Icon(Icons.add)),
        onPressed: () => Get.to(AddNewsFeed()),
      ),
      body: ListView.builder(
        itemCount: _newsFeed.length,
        itemBuilder: (context, index) {
          final newsFeed = _newsFeed[index];

          return NewWidget(
            title: newsFeed.title,
            desp: newsFeed.description
                .replaceAll('<p>', '')
                .replaceAll('</p>', ''),
            image: newsFeed.image.isEmpty
                ? Image.asset(
                    'assets/images/default.jpg',
                  )
                : Image.network(
                    'https://perpaycommittee.com/${newsFeed.image}'),
          );
        },
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  String title;
  String desp;
  Widget image;
  NewWidget({
    Key? key,
    required this.title,
    required this.desp,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              desp,
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Padding(padding: const EdgeInsets.all(8.0), child: image),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite_border),
              Icon(Icons.comment),
              Icon(Icons.share),
            ],
          )
        ],
      ),
    );
  }
}
