import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/Authentication/change_password.dart';
import 'package:lucky_committee/app/Views/Authentication/editProfile.dart';
import 'package:lucky_committee/app/Views/main/screens/notifications.dart';
import 'package:lucky_committee/app/Views/main/screens/privacyPolicy.dart';
import 'package:lucky_committee/app/Views/main/screens/Videos/videoView.dart';
import 'package:lucky_committee/app/Views/main/screens/Home/homeView.dart';
import 'package:lucky_committee/app/Views/main/screens/News%20&%20Blogs/newsFeedScreen.dart';
import 'package:lucky_committee/app/Views/main/screens/chngProfilePic.dart';
import 'package:lucky_committee/app/Views/main/screens/contactUs.dart';
import 'package:lucky_committee/app/Views/main/screens/payScreen.dart';
import 'package:lucky_committee/app/Views/main/screens/Winners/winnerview.dart';
import 'package:get/get.dart';
import 'package:lucky_committee/app/Views/main/screens/addcnic.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lucky_committee/app/Widgets/pageTransition.dart';

import 'Authentication/welcome.dart';

class BottomNavigation extends StatefulWidget {
  final String? apiToken;
  final String? phoneNumber;

  const BottomNavigation({
    this.apiToken,
    this.phoneNumber,
  });

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  bool _loading = true;
  int currentTab = 0;
  List<Widget> screens = [];
  Widget currentScreen = Home(
    apiToken: '',
    phoneNumber: '',
  );

  @override
  void initState() {
    super.initState();
    _fetchCommittees();
    screens = [
      Home(
        phoneNumber: widget.phoneNumber.toString(),
        apiToken: widget.apiToken.toString(),
      ),
      const YouTubeVideosView(),
      Pay(),
      NewsFeedScreen(
        token: widget.apiToken.toString(),
      ),
      const WinnerScreen()
    ];
    currentScreen = screens[currentTab];
  }

  Future<void> _fetchCommittees() async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://perpaycommittee.com/api/committee-shows'),
        headers: {
          'Authorization': 'Bearer ${widget.apiToken}',
        },
      );

      if (response.statusCode == 200) {
        final committeeShow =
            // CommitteeShow.fromJson(json.decode(response.body));
            setState(() {
          // _committees = committeeShow.committees;
        });
      } else {
        throw Exception('Failed to fetch committees: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  final PageStorageBucket bucket = PageStorageBucket();
  Future<void> logout(String token) async {
    final url = 'https://perpaycommittee.com/api/logout';
    final headers = {'Authorization': 'Bearer $token'};

    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json['status'] == true) {
        EasyLoading.show();
        print('Logout successful');
        Navigator.pushReplacement(context, PageTransition(const WelcomeView()));
        EasyLoading.dismiss();
      } else {
        EasyLoading.show();
        print('Logout failed');
      }
    } else {
      // print(widget.apiToken);
      print('HTTP Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () => scaffoldKey.currentState!.openDrawer(),
            child: CircleAvatar(
                child: SvgPicture.asset(
              'assets/svgs/user.svg',
            )),
          ),
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[kBrownColor, kMainColor2]),
          ),
        ),
        // backgroundColor:,
        title: Image.asset(
          "assets/icons/applogo2.png",
          height: 80,
        ),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.more_vert_outlined))
        ],
      ),
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [kBrownColor, kMainColor2],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 6.0, top: 5, bottom: 5),
                child: OpenContainer(
                  transitionType: ContainerTransitionType.fadeThrough,
                  transitionDuration: const Duration(milliseconds: 600),
                  openElevation: 3,
                  closedBuilder: (_, openContainer) {
                    return Container(
                      height: 55.0,
                      width: 45.0,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [kBrownColor, kMainColor2],
                          ),
                          borderRadius: BorderRadius.circular(70)),
                      padding: const EdgeInsets.all(2),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: SvgPicture.asset(
                          'assets/svgs/user.svg',
                        ),
                      ),
                    );
                  },
                  // openColor: Colors.white,
                  closedElevation: 50.0,
                  closedShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  // closedColor: Colors.white,
                  openBuilder: (_, closeContainer) {
                    return EditProfile();
                  },
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Change profile picture'),
              onTap: () {
                Get.to(ChangeProfilePic());
              },
            ),
            ListTile(
              onTap: () {
                Get.to(AddCNIC(
                  token: widget.apiToken.toString(),
                ));
              },
              leading: const Icon(Icons.numbers),
              title: const Text('Add CNIC Number'),
            ),
            ListTile(
              leading: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              onTap: () {
                Get.to(() => NotificationsView(
                      token: widget.apiToken.toString(),
                    ));
              },
            ),
            ListTile(
              leading: const Icon(Icons.privacy_tip),
              title: const Text('Terms and Conditions'),
              onTap: () {
                Get.to(() => const TermsAndconditions());
              },
            ),
            ListTile(
              leading: const Icon(Icons.password),
              title: const Text('Change Password'),
              onTap: () {
                Get.to(() => ChangePassword());
              },
            ),
            ListTile(
              leading: const Icon(Icons.contact_page),
              title: const Text('Contact us'),
              onTap: () {
                Get.to(ContactUs());
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('LOGOUT >'),
              onTap: () => logout(widget.apiToken!),
            ),
            const SizedBox(
              height: 100,
            ),
            Image.asset(
              "assets/icons/applogo2.png",
              height: 100,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // backgroundColor: Colors.transparent,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xffFD4F0E), Color(0xffFF9A0A)],
              ),
              borderRadius: BorderRadius.circular(50)),
          child: const Center(child: Text('Pay')),
        ),
        onPressed: () {
          Get.bottomSheet(
            Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [kBrownColor, kMainColor2]),
                  borderRadius: BorderRadius.circular(15)),
              // height: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        InkWell(
                          onTap: () => Get.back(),
                          child: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Image.asset(
                        "assets/icons/applogo1.png",
                        height: 70,
                      ),
                      const Text(
                        'Select Payment Method',
                        style: h20HeadingWhiteBold,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: kLightColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/easypaisa.png",
                              height: 30,
                            ),

                            // const Text(
                            //   "",
                            //   style: h13HeadingWhiteBold,
                            // ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: kOrangeColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        border: Border.all(color: kLightColor),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                          left: 10,
                          right: 10,
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/jazzcash.png",
                              height: 90,
                            ),
                            const Spacer(),
                            Container(
                              decoration: BoxDecoration(
                                  color: kOrangeColor,
                                  borderRadius: BorderRadius.circular(10)),
                              child: const Padding(
                                padding: EdgeInsets.all(6.0),
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: kWhiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
            elevation: 10.0,
            backgroundColor: kWhiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(35),
            ),
          );
          // setState(() {
          //   currentScreen = Pay();
          //   currentTab = 2;
          // });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        // color: kMainColor,
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          color: kWhiteColor,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentScreen = Home(
                          phoneNumber: widget.apiToken.toString(),
                          apiToken: widget.apiToken.toString(),
                        );
                        currentTab = 0;
                      });
                    },
                    child: SizedBox(
                      width: 75,
                      child: Column(
                        children: [
                          Icon(
                            Icons.home,
                            color:
                                currentTab == 0 ? Colors.orange : Colors.grey,
                          ),
                          Text(
                            'Home',
                            style: TextStyle(
                                fontSize: 12,
                                color: currentTab == 0
                                    ? Colors.orange
                                    : Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentScreen = const YouTubeVideosView();
                        currentTab = 1;
                      });
                    },
                    child: SizedBox(
                      width: 70,
                      child: Column(
                        children: [
                          Icon(
                            Icons.videocam,
                            color:
                                currentTab == 1 ? Colors.orange : Colors.grey,
                          ),
                          Text(
                            'Videos',
                            style: TextStyle(
                                fontSize: 12,
                                color: currentTab == 1
                                    ? Colors.orange
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //right tab bar icons
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentScreen = NewsFeedScreen(
                          token: widget.apiToken.toString(),
                        );
                        currentTab = 3;
                      });
                    },
                    child: SizedBox(
                      width: 80,
                      child: Column(
                        children: [
                          Icon(
                            Icons.newspaper,
                            color:
                                currentTab == 3 ? Colors.orange : Colors.grey,
                          ),
                          Text(
                            'News',
                            style: TextStyle(
                                fontSize: 12,
                                color: currentTab == 3
                                    ? Colors.orange
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        currentScreen = const WinnerScreen();
                        currentTab = 4;
                      });
                    },
                    child: SizedBox(
                      width: 75,
                      child: Column(
                        children: [
                          Icon(
                            Icons.production_quantity_limits,
                            color:
                                currentTab == 4 ? Colors.orange : Colors.grey,
                          ),
                          Text(
                            'Winnings',
                            style: TextStyle(
                                fontSize: 12,
                                color: currentTab == 4
                                    ? Colors.orange
                                    : Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
