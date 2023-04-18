// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:lucky_committee/app/Models/cardList.dart';
// import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
// import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';

// class ProductView extends StatefulWidget {
//   ProductView({
//     required this.shoppingListData,
//   });

//   final ShoppingListData shoppingListData;

//   @override
//   _ProductViewState createState() => _ProductViewState();
// }

// class _ProductViewState extends State<ProductView> {
//   int quantity = 1;
//   bool isPressed = true;
//   // double _lowerValue = 50;
//   // double _upperValue = 180;
//   double scale = 1;
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: Colors.white,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 10,
//               ),
//               child: Container(
//                 height: 40,
//                 width: double.infinity,
//                 color: Colors.white,
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     InkWell(
//                       onTap: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(12.0),
//                         child: Icon(
//                           Icons.arrow_back,
//                           color: kDarkColor,
//                           size: 25,
//                         ),
//                       ),
//                     ),
//                     InkWell(
//                       onTap: () {
//                         setState(() {
//                           isPressed = !isPressed;
//                         });
//                       },
//                       child: Padding(
//                         padding: const EdgeInsets.all(15),
//                         child: Icon(
//                           Icons.favorite,
//                           color: isPressed ? kDarkColor : kMainColor,
//                           size: 25,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             Transform.scale(
//               scale: scale,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 80, top: 20),
//                 child: Image.asset(
//                   widget.shoppingListData.imagePath,
//                   height: 200,
//                   width: 200,
//                   fit: BoxFit.contain,
//                 ),
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Slider(
//               value: scale,
//               min: 0.5,
//               max: 1.5,
//               activeColor: kMainColor,
//               onChanged: (value) {
//                 setState(() {
//                   scale = value;
//                 });
//               },
//             ),
//             // SizedBox(
//             //   height: 20,
//             // ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     widget.shoppingListData.titleTxt,
//                     style: h22HeadingBlackBold,
//                   ),
//                   Container(
//                     height: 30,
//                     width: 110,
//                     decoration: BoxDecoration(
//                       color: kLightColor,
//                       borderRadius: BorderRadius.circular(20.0),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         IconButton(
//                           onPressed: () {
//                             setState(
//                               () {
//                                 quantity++;
//                               },
//                             );
//                           },
//                           icon: const Icon(
//                             Icons.add,
//                             size: 17,
//                           ),
//                         ),
//                         // Image.asset(
//                         //   "assets/images/add.png",
//                         //   width: 10,
//                         // ),

//                         Text(quantity.toString(), style: h16HeadingBlackBold),

//                         IconButton(
//                           onPressed: () {
//                             if (quantity > 1) {
//                               setState(() {
//                                 quantity--;
//                               });
//                             } else {
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(
//                                       content: Text(
//                                           'Items can\'t be lesst then 1')));
//                             }
//                           },
//                           icon: const Icon(
//                             Icons.remove,
//                             size: 17,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 5,
//             ),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//             //   child: Text(
//             //     "Colors",
//             //     style: h18HeadingBlackBold,
//             //   ),
//             // ),
//             // Padding(
//             //   padding: const EdgeInsets.symmetric(
//             //     horizontal: 60,
//             //     vertical: 10,
//             //   ),
//             //   child: Row(
//             //     children: [
//             //       buildColorContainer(Colors.red),
//             //       SizedBox(
//             //         width: 20,
//             //       ),
//             //       buildColorContainer(Colors.yellow),
//             //       SizedBox(
//             //         width: 20,
//             //       ),
//             //       buildColorContainer(Colors.green),
//             //       SizedBox(
//             //         width: 20,
//             //       ),
//             //       buildColorContainer(Colors.blue),
//             //     ],
//             //   ),
//             // ),
//             Padding(
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 10,
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text("Description", style: h18HeadingBlackSimple),
//                   RatingBar.builder(
//                     initialRating: 3,
//                     itemCount: 5,
//                     itemSize: 18,
//                     itemBuilder: (context, index) {
//                       switch (index) {
//                         case 0:
//                           return const Icon(
//                             Icons.star,
//                             color: kMainColor,
//                           );
//                         case 1:
//                           return const Icon(
//                             Icons.star,
//                             color: kMainColor,
//                           );
//                         case 2:
//                           return const Icon(
//                             Icons.star,
//                             color: kMainColor,
//                           );
//                         case 3:
//                           return const Icon(
//                             Icons.star_half,
//                             color: kMainColor,
//                           );
//                         case 4:
//                           return const Icon(
//                             Icons.star,
//                             color: kLightColor,
//                           );
//                       }
//                       return Container();
//                     },
//                     onRatingUpdate: (rating) {
//                       print(rating);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               child: Container(
//                 height: 100,
//                 width: 400,
//                 child: Text(
//                   widget.shoppingListData.detail,
//                   style: h13HeadingBlackSimple,
//                 ),
//               ),
//             ),
//             const Spacer(),
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Column(
//                     children: [
//                       Text("Total Price",
//                           style: h16HeadingBlackBold.copyWith(
//                               color: kDarkLightColor)),
//                       Text(widget.shoppingListData.totalPrice,
//                           style: h25HeadingBlackBold),
//                     ],
//                   ),
//                   MaterialButton(
//                     elevation: 4,
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20.0)),
//                     onPressed: () {},
//                     height: 40,
//                     minWidth: 85,
//                     splashColor: kLightColor,
//                     color: kMainColor,
//                     child: const Text("Book Now", style: h16HeadingWhiteBold),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildColorContainer(Color color) {
//     return Container(
//       height: 15,
//       width: 15,
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(20),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.8),
//             blurRadius: 2.0,
//             // spreadRadius: 1.0,
//             offset: const Offset(0, 3),
//           )
//         ],
//       ),
//     );
//   }
// }
