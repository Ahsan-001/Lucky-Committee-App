import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart' as cuvre;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lucky_committee/app/Models/commiteemodel.dart';
import 'dart:ui' as ui;
import 'package:http/http.dart' as http;
import 'package:lucky_committee/app/Models/userprofilemodel.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Views/main/screens/Home/Components/productView.dart';

import 'package:lucky_committee/app/Views/main/screens/Home/democard.dart';

class Home extends StatefulWidget {
  final String apiToken;
  final String phoneNumber;
  const Home({required this.phoneNumber, required this.apiToken});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  final double _borderRadius = 24;
  // late AnimationController _controller;
  List<Committee> _committees = [];
  List<Product> _products = [];
  bool _loading = true;

  ///
  Future<UserProfile?> fetchUser(String apiUrl, String authToken) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      return UserProfile.fromJson(jsonMap['user']);
    } else {
      throw Exception('Failed to fetch user: ${response.statusCode}');
    }
  }

  ///
  @override
  void initState() {
    super.initState();

    _fetchCommittees();
  }

  Future<void> _fetchCommittees() async {
    setState(() {
      _loading = true;
    });

    try {
      final response = await http.get(
        Uri.parse('https://committee.com/api/committee-shows'),
        headers: {
          'Authorization': 'Bearer ${widget.apiToken}',
        },
      );

      if (response.statusCode == 200) {
        final committeeShow =
            CommitteeShow.fromJson(json.decode(response.body));
        setState(() {
          _committees = committeeShow.committees;
        });
      } else {
        throw Exception('Failed to fetch committees: ${response.statusCode}');
      }
    } catch (e) {
      // Handle error
      print('----------');
      print(e.toString());
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    // _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      resizeToAvoidBottomInset: false,
      body: ListView(
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FutureBuilder<UserProfile?>(
                        future: fetchUser(
                            'https://perpaycommittee.com/api/view-profile',
                            widget.apiToken),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (snapshot.hasError) {
                            return Center(
                              child: Text('Error: ${snapshot.error}'),
                            );
                          } else if (!snapshot.hasData) {
                            return const Center(
                              child: Text('No user data available'),
                            );
                          } else {
                            final userProfile = snapshot.data!;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: kWhiteColor,
                                      radius: 20,
                                      backgroundImage: userProfile.image != null
                                          ? NetworkImage(
                                              'https://perpaycommittee.com/${userProfile.image}')
                                          : const AssetImage(
                                                  'assets/icons/user.png')
                                              as ImageProvider,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    Text(
                                      userProfile.name,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: kWhiteColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      'Account: ',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: kWhiteColor,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      userProfile.phone
                                          .replaceFirst('+92', '0'),
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: kWhiteColor.withOpacity(0.7),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            );
                          }
                        }),
                    Column(
                      children: [
                        Image.asset(
                          "assets/icons/wallet.png",
                          height: 40,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          "Rs. 0",
                          style: h23HeadingWhiteBold.copyWith(
                              color: kWhiteColor.withOpacity(0.8)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          _loading
              ? const Center(child: CircularProgressIndicator.adaptive())
              : SizedBox(
                  height: 500,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: _committees.length,
                      itemBuilder: (context, index) {
                        final committee = _committees[index];
                        final products = committee.products;
                        return SizedBox(
                          child: Stack(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 265,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        // color: kMainColor,
                                        borderRadius: BorderRadius.circular(15),
                                        color: kWhiteColor,

                                        boxShadow: [
                                          BoxShadow(
                                              blurRadius: 3.0,
                                              spreadRadius: 0.9,
                                              color:
                                                  kBlackColor.withOpacity(0.2))
                                        ],
                                      ),
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 75,
                                          ),
                                          committee.products.isEmpty
                                              ? const SizedBox(
                                                  height: 140,
                                                  child: Center(
                                                      child:
                                                          Text('no products')),
                                                )
                                              : SizedBox(
                                                  height: 140,
                                                  child: ListView.builder(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    itemCount: committee
                                                        .products.length,
                                                    itemBuilder:
                                                        (BuildContext context,
                                                            int index2) {
                                                      return Column(
                                                        children: [
                                                          Image.network(
                                                            'https://perpaycommittee.com/${committee.products[index2].image}',
                                                            height: 100,
                                                            width: 180,
                                                          ),
                                                          const SizedBox(
                                                            height: 7,
                                                          ),
                                                          Text(committee
                                                              .products[index2]
                                                              .title),
                                                        ],
                                                      );
                                                    },
                                                  ),
                                                ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40),
                                            child: InkWell(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductListView(
                                                            committee:
                                                                committee,
                                                            index: index,
                                                            products: committee
                                                                .products),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                width: double.infinity,
                                                height: 40.0,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  gradient:
                                                      const LinearGradient(
                                                    begin: Alignment.topLeft,
                                                    end: Alignment.bottomRight,
                                                    colors: [
                                                      Color(0xffFD4F0E),
                                                      Color(0xffFF9A0A)
                                                    ],
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                child: Text(
                                                  'VIEW',
                                                  style: h16HeadingBlackBold
                                                      .copyWith(
                                                          color: kWhiteColor),
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
                                  ],
                                ),
                              ),
                              Positioned(
                                child: ClipPath(
                                  clipper: cuvre.OvalBottomBorderClipper(),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Container(
                                      height: 80,
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                kBrownColor,
                                                kMainColor2
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: Column(
                                          children: [
                                            Text(
                                              committee.name,
                                              style: h18HeadingWhiteBold,
                                            ),
                                            const SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image.asset(
                                                  "assets/icons/applogo1.png",
                                                  height: 30,
                                                ),
                                                Container(
                                                    height: 20,
                                                    width: 2,
                                                    color: kWhiteColor),
                                                Text(
                                                  'Rs.${committee.prize.toString()}',
                                                  style: h16HeadingWhiteBold
                                                      .copyWith(
                                                          color:
                                                              Colors.white70),
                                                ),
                                                Container(
                                                    height: 20,
                                                    width: 2,
                                                    color: kWhiteColor),
                                                Text(
                                                  DateFormat('MMMM dd').format(
                                                      committee.expiryDate),
                                                  style: h13HeadingWhiteBold
                                                      .copyWith(
                                                          color:
                                                              Colors.white70),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }))
        ],
      ),
      // appBar: AppBar(
      //   toolbarHeight: 150,
      //   flexibleSpace: ClipPath(
      //     clipper: WaveClipperTwo(flip: true),
      //     child: Container(
      //       height: 120,
      //       color: kMainColor,
      //       child: const Center(child: Text("WaveClipperTwo(flip: true)")),
      //     ),
      //   ),
      // ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       HomeCard(
      //         ontap: (() => Get.to(ProductListView())),
      //         title: "Rs. 01",
      //       ),
      //       HomeCard(
      //         title: "Rs. 100",
      //       ),
      //       HomeCard(
      //         title: "Rs. 300",
      //       ),
      //       HomeCard(
      //         title: "Rs. 500",
      //       ),
      //       HomeCard(
      //         title: "Rs. 1000",
      //       ),
      //     ],
      //   ),
      // ),

      // body: ListView.builder(
      //   itemCount: items.length,
      //   itemBuilder: (context, index) {
      //     return Center(
      //       child: InkWell(
      //         onTap: () => Get.to(ProductListView()),
      //         child: Padding(
      //           padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      //           child: Stack(
      //             alignment: Alignment.center,
      //             children: [
      //               Container(
      //                 height: 70,
      //                 decoration: BoxDecoration(
      //                   borderRadius: BorderRadius.circular(_borderRadius),
      //                   gradient: LinearGradient(
      //                       colors: [
      //                         items[index].startColor,
      //                         items[index].endColor
      //                       ],
      //                       begin: Alignment.topLeft,
      //                       end: Alignment.bottomRight),
      //                   // boxShadow: [
      //                   //   BoxShadow(
      //                   //     color: items[index].endColor,
      //                   //     blurRadius: 12,
      //                   //     offset: const Offset(0, 6),
      //                   //   ),
      //                   // ],
      //                 ),
      //               ),
      //               Positioned(
      //                 right: 0,
      //                 bottom: 0,
      //                 top: 0,
      //                 child: CustomPaint(
      //                   size: const Size(100, 150),
      //                   painter: CustomCardShapePainter(_borderRadius,
      //                       items[index].startColor, items[index].endColor),
      //                   child: SizedBox(
      //                     height: 50,
      //                     width: 50,
      //                     child: Image.asset(
      //                       "assets/icons/applogo1.png",
      //                       // height: 50,
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //               Positioned.fill(
      //                 child: Padding(
      //                   padding: const EdgeInsets.only(left: 20),
      //                   child: Row(
      //                     children: [
      //                       Image.asset(
      //                         "assets/images/pakistan.png",
      //                         height: 30,
      //                       ),
      //                       SizedBox(
      //                         width: 10,
      //                       ),
      //                       Text(
      //                         items[index].name,
      //                         style: h23HeadingWhiteBold,
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //         ),
      //       ),
      //     );
      //   },
      // ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String category;
  final String location;
  final double rating;
  final Color startColor;
  final Color endColor;

  PlaceInfo(this.name, this.startColor, this.endColor, this.rating,
      this.location, this.category);
}

class CustomCardShapePainter extends CustomPainter {
  final double radius;
  final Color startColor;
  final Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        const Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
