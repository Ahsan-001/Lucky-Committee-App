import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:lucky_committee/app/Models/blogModel.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Widgets/blogsCard.dart';

class BlogsDetail extends StatelessWidget {
  final Blog blog;
  const BlogsDetail({super.key, required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhiteColor,
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        iconTheme: const IconThemeData(color: kBlackColor),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "DESIGN",
              style: h16HeadingBlackBold.copyWith(color: kOrangeColor),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              blog.title,
              style: h25HeadingBlackSimple,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Published from ofspace",
                  style: h13HeadingBlackSimple.copyWith(color: kDarkLightColor),
                ),
                Text(
                  DateFormat('MMMM dd yyyy').format(blog.createdAt),
                  style: h13HeadingBlackSimple.copyWith(color: kDarkLightColor),
                )
              ],
            ),
            const SizedBox(height: 20),
            blog.image.isNotEmpty
                ? Image.network('https://perpaycommittee.com/${blog.image}')
                : Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Placeholder_view_vector.svg/681px-Placeholder_view_vector.svg.png'),
            const SizedBox(height: 20),
            Text(blog.description),
          ],
        ),
      ),
    );
  }
}
