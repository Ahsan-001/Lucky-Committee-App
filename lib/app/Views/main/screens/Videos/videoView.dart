import 'package:flutter/material.dart';
import 'package:lucky_committee/app/Models/channelModel.dart';
import 'package:lucky_committee/app/Models/videoModel.dart';
import 'package:lucky_committee/app/Services/api_service.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/main/screens/Videos/Components/openvideoview.dart';

import 'package:lucky_committee/app/Views/main/screens/Home/democard.dart';

class YouTubeVideosView extends StatefulWidget {
  const YouTubeVideosView({super.key});

  @override
  _YouTubeVideosViewState createState() => _YouTubeVideosViewState();
}

class _YouTubeVideosViewState extends State<YouTubeVideosView> {
  Channel? _channel;
  final bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initChannel();
  }

  _initChannel() async {
    Channel channel = await APIService.instance
        .fetchChannel(channelId: 'UC6Dy0rQ6zDnQuHQ1EeErGUA');
    setState(() {
      _channel = channel;
    });
  }

  // _buildProfileInfo() {
  //   return Container(
  //     margin: const EdgeInsets.all(20.0),
  //     padding: const EdgeInsets.all(20.0),
  //     height: 100.0,
  //     decoration: const BoxDecoration(
  //       color: Colors.white,
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black12,
  //           offset: Offset(0, 1),
  //           blurRadius: 6.0,
  //         ),
  //       ],
  //     ),
  //     child: Row(
  //       children: [
  //         CircleAvatar(
  //           backgroundColor: Colors.white,
  //           radius: 35.0,
  //           backgroundImage: NetworkImage(_channel!.profilePictureUrl!),
  //         ),
  //         const SizedBox(width: 12.0),
  //         Expanded(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 _channel!.title!,
  //                 style: const TextStyle(
  //                   color: Colors.black,
  //                   fontSize: 20.0,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //               Text(
  //                 '${_channel!.subscriberCount} subscribers',
  //                 style: TextStyle(
  //                   color: Colors.grey[600],
  //                   fontSize: 16.0,
  //                   fontWeight: FontWeight.w600,
  //                 ),
  //                 overflow: TextOverflow.ellipsis,
  //               ),
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }

  _buildVideo(Video video) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => VideoScreen(id: video.id),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        padding: const EdgeInsets.all(10.0),
        height: 120.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 1),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          children: <Widget>[
            Container(
              height: 100,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                    image: NetworkImage(video.thumbnailUrl!),
                  )),
            ),
            // Image(
            //   width: 150.0,
            //   image: NetworkImage(video.thumbnailUrl!),
            // ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Text(
                video.title!,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      // appBar: AppBar(
      //   leading: Padding(
      //     padding: const EdgeInsets.all(8.0),
      //     child: InkWell(
      //       onTap: () => scaffoldKey.currentState!.openDrawer(),
      //       child: CircleAvatar(
      //           child: SvgPicture.asset(
      //         'assets/svgs/user.svg',
      //       )),
      //     ),
      //   ),
      //   backgroundColor: kMainColor,
      //   title: const Text('Videos'),
      //   centerTitle: true,
      //   elevation: 0,
      // ),
      body: _channel != null
          ? NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollDetails) {
                if (!_isLoading &&
                    _channel!.videos!.length !=
                        int.parse(_channel!.videoCount!) &&
                    scrollDetails.metrics.pixels ==
                        scrollDetails.metrics.maxScrollExtent) {
                  Container();
                }
                return false;
              },
              child: ListView.builder(
                itemCount: 1 + _channel!.videos!.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    // return _buildProfileInfo();
                    return Column(
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
                            // color: kBrownColor,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 0, vertical: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Videos",
                                              style: h25HeadingWhiteBold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  }
                  Video video = _channel!.videos![index - 1];
                  return _buildVideo(video);
                },
              ),
            )
          : Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).primaryColor, // Red
                ),
              ),
            ),
    );
  }
}
