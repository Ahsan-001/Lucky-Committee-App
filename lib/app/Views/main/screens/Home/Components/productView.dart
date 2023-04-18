import 'package:flutter/material.dart';
import 'package:lucky_committee/app/Models/cardList.dart';
import 'package:lucky_committee/app/Models/commiteemodel.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appColors.dart';
import 'package:lucky_committee/app/Utils/AppTextStyleAndColors/appTextStyle.dart';
import 'package:lucky_committee/app/Widgets/shoppingCard.dart';
import 'package:http/http.dart' as http;
import 'package:lucky_committee/app/Views/main/screens/Home/democard.dart';

import '../homeView.dart';

class ProductListView extends StatelessWidget {
  final List<Product> products;
  final int index;
  final Committee committee;
  ProductListView(
      {super.key,
      required this.products,
      required this.index,
      required this.committee});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: <Color>[kBrownColor, kMainColor2]),
          ),
        ),
        backgroundColor: kBrownColor,
        elevation: 0,
        centerTitle: true,
        title: Text('For ${committee.prize} rupees'),
      ),
      body: ListView(
        // physics: const NeverScrollableScrollPhysics(),
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
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 68.0,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Get items worth a fortune for just Rs.${committee.prize}",
                          style: h18HeadingWhiteSimple,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Simply select a product from below and purchase it for the price for Rs. ${committee.prize} and get a chance to win.",
                          style: h11HeadingWhiteSimple.copyWith(
                              color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 300,
            height: 700,
            child: products.isNotEmpty
                ? GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 300,
                            childAspectRatio: 4 / 5,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 5),
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: products.length,
                    itemBuilder: (BuildContext context, int index) {
                      final product = products[index];
                      return GestureDetector(
                        onTap: () {
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => ProductView(
                          //             shoppingListData: shoppingListData[index])));
                        },
                        child: ShoppingCardDisplay(
                          prize: product.price,
                          images:
                              'https://perpaycommittee.com/${product.image}',
                          name: product.title,
                          desp: product.shortDescription,
                        ),
                      );
                    },
                  )
                : const Center(child: Text('Product not found')),
          ),
        ],
      ),
    );
  }
}
