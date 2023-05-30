import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:market_place/core/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:market_place/main_page/widgets/bottom_fixed_widget.dart';
import 'package:market_place/main_page/widgets/product_item_card.dart';
import 'package:market_place/utils/constants.dart';
import 'package:market_place/utils/extensions.dart';

class ProductDetails extends StatefulHookConsumerWidget {
  const ProductDetails({super.key});

  @override
  ConsumerState<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends ConsumerState<ProductDetails>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hoodieShots = ref.watch(mainPageVM.select((it) => it.hoodieViews));
    return Scaffold(
      backgroundColor: const Color(0xffFCFCFD),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Color(0xff2A2D40),
          ),
        ),
        actions: [
          SvgPicture.asset('share'.svg),
          const Gap(10),
          SvgPicture.asset('heart'.svg),
          const Gap(10),
          SvgPicture.asset('shopping-bag'.svg),
          const Gap(10),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.screenWidth(.06),
              vertical: context.screenHeight(.02)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: context.screenHeight(.4),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffEEEEEF),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutterxfirestore.appspot.com/o/hoodie-removebg-preview.png?alt=media&token=40af9516-97af-4ef3-9b20-9a0c0e01a4b4",
                      fit: BoxFit.contain,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: hoodieShots
                          .map(
                            (it) => Container(
                              height: context.screenHeight(.05),
                              width: context.screenWidth(.1),
                              margin:
                                  const EdgeInsets.only(left: 10, bottom: 16),
                              decoration: BoxDecoration(
                                color: const Color(0xffC4C4C5),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  it,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
              const Gap(10),
              const Text(
                "Essentials Men's Long-Sleeve Crewneck T-Shirt",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
              ),
              const Gap(20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Color(0xffEA9A3B),
                      ),
                      Text(
                        " 4.9 Ratings",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xff868992)),
                      ),
                    ],
                  ),
                  BulletWidget(),
                  Text(
                    "2.3k+ Reviews",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff868992),
                    ),
                  ),
                  BulletWidget(),
                  Text(
                    "2.9k+ Sold",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xff868992),
                    ),
                  ),
                ],
              ),
              const Gap(20),
              TabBar(
                padding: EdgeInsets.zero,
                indicatorPadding: const EdgeInsets.only(right: 8),
                labelPadding: const EdgeInsets.only(right: 24),
                controller: _controller,
                isScrollable: true,
                tabs: const [
                  Tab(
                    text: "About Item",
                  ),
                  Tab(
                    text: "Reviews",
                  )
                ],
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: const Color(0xff4AB299),
                labelStyle: const TextStyle(
                  color: Color(0xff4AB299),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
                labelColor: const Color(0xff4AB299),
                unselectedLabelColor: const Color(0xff4AB299),
              ),
              const Gap(14),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextRow(
                        title: "Brand",
                        value: "ChAmkpR",
                      ),
                      TextRow(
                        title: "Category",
                        value: "Casual Shirt",
                      ),
                      TextRow(
                        title: "Condition",
                        value: "New",
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextRow(
                        title: "Color",
                        value: "Aprikot",
                      ),
                      TextRow(
                        title: "Material",
                        value: "Polyester",
                      ),
                      TextRow(
                        title: "Heavy",
                        value: "200 g",
                      ),
                    ],
                  ),
                ],
              ),
              const MarketplaceDivider(),
              const Text(
                "Description: ",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const Gap(10),
              const DescriptionTexts(
                  "Long-sleeve dress shirt in classicfit featuring\n   button-down collar"),
              const DescriptionTexts("Patch Pocket on Left Chest"),
              const DescriptionTexts("Durable Combination Cotton Fabric"),
              const DescriptionTexts("Comfortable and quality dress shirt"),
              const DescriptionTexts(
                  "Go to Classic button down shirt for all\n   occasions"),
              const Gap(20),
              const Text(
                "Chat us if there is anything you want to ask about the product.",
                style: TextStyle(
                  color: Color(0xff4AB299),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              const MarketplaceDivider(),
              const Text(
                "Shipping Information: ",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 20),
              ),
              const Gap(10),
              const TextRow(
                  title: "Delivery", value: "Shipping from Jakarta, Indonesia"),
              const TextRow(
                  title: "Shipping", value: "FREE International Shipping"),
              const TextRow(
                  title: "Arrival",
                  value: "Estimated arrival on 25 -27 Oct 2022"),
              const MarketplaceDivider(),
              const Text(
                "Reviews & Rating",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff2A2D40),
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          text: '4.9 ',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                          children: <TextSpan>[
                            TextSpan(
                              text: '/5.0',
                              style: TextStyle(
                                fontSize: 16,
                                color: kBlack.withOpacity(0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      RatingBar.builder(
                        unratedColor: const Color(0xff868992).withOpacity(0.5),
                        itemSize: 18,
                        initialRating: 4.5,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Color(0xffEA9A3B),
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Gap(context.screenHeight(.055)),
                      const Text(
                        "2.3k+ Reviews",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xff868992),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Column(
                    children: [
                      RatingWidget(
                        starNumber: "5",
                        numberOfRating: "1.5k",
                        divisor: 4.5,
                      ),
                      RatingWidget(
                        starNumber: "5",
                        numberOfRating: "710",
                        divisor: 3,
                      ),
                      RatingWidget(
                        starNumber: "5",
                        numberOfRating: "140",
                        divisor: 1.5,
                      ),
                      RatingWidget(
                        starNumber: "5",
                        numberOfRating: "10",
                        divisor: 0.5,
                      ),
                      RatingWidget(
                        starNumber: "5",
                        numberOfRating: "4",
                        divisor: .1,
                      ),
                    ],
                  ),
                ],
              ),
              const Gap(20),
              const Text(
                "Reviews with images & videos",
                style: TextStyle(
                    fontSize: 20,
                    color: Color(0xff2A2D40),
                    fontWeight: FontWeight.w700),
              ),
              const Gap(10),
              SizedBox(
                height: context.screenHeight(.1),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: hoodieShots.map(
                    (it) {
                      return Container(
                        height: context.screenHeight(.1),
                        width: context.screenWidth(.19),
                        margin: const EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: const Color(0xffC4C4C5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            it,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),
              const MarketplaceDivider(),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recommendation",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xff2A2D40),
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "See more",
                    style: TextStyle(
                        fontSize: 16,
                        color: Color(0xff4AB299),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Gap(20),
              GridView.builder(
                itemCount: 20,
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: context.screenHeight(.3),
                    mainAxisSpacing: context.screenWidth(.04),
                    crossAxisSpacing: context.screenWidth(.04)),
                itemBuilder: (context, index) {
                  final double randomRating =
                      Random().nextDouble() * (5.0 - 4.5) + 4.5;
                  final int randomSales = Random().nextInt(5000 - 3000) + 3000;
                  final int randomPrice = Random().nextInt(50 - 10) + 10;
                  return ProductItemCard(
                    randomRating: randomRating,
                    randomSales: randomSales,
                    randomPrice: randomPrice,
                    index: index,
                  );
                },
              )
            ].animatedList(),
          ),
        ),
      ),
      bottomNavigationBar: const BottomFixedWidget(),
    );
  }
}

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.starNumber,
    required this.numberOfRating,
    required this.divisor,
  });
  final String starNumber, numberOfRating;
  final double divisor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.screenWidth(.55),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          const Icon(
            Icons.star,
            color: Color(0xffEA9A3B),
          ),
          const Gap(5),
          const Text(
            "5",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xff868992),
            ),
          ),
          const Gap(5),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              children: [
                Center(
                  child: Container(
                    height: 10,
                    width: context.screenWidth(.33),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff868992).withOpacity(0.2),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AnimatedContainer(
                    height: 10,
                    width: context.screenWidth(
                      0.33 / (5 / divisor),
                    ),
                    duration: const Duration(milliseconds: 400),
                    curve: Curves.decelerate,
                    decoration: BoxDecoration(
                      color: const Color(0xFF53A18B),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(10),
          Text(
            numberOfRating,
            style: const TextStyle(
              fontSize: 16,
              color: Color(0xff868992),
            ),
          ),
        ],
      ),
    );
  }
}

class MarketplaceDivider extends StatelessWidget {
  const MarketplaceDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: Divider(
        color: Colors.grey.withOpacity(0.5),
      ),
    );
  }
}

class TextRow extends StatelessWidget {
  final String title;
  final String value;

  const TextRow({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.screenHeight(.01)),
      child: Row(
        children: [
          Text(
            "$title:",
            style: const TextStyle(
              color: Color(0xff4AB299),
              fontWeight: FontWeight.w500,
              fontSize: 16,
            ),
          ),
          Text(
            "   $value",
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class DescriptionTexts extends StatelessWidget {
  final String text;

  const DescriptionTexts(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: context.screenHeight(.005)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              "• $text",
              style: const TextStyle(
                  color: Color(0xff4AB299),
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class BulletWidget extends StatelessWidget {
  const BulletWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.screenWidth(.01),
      width: context.screenWidth(.01),
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Color(0xff868992)),
    );
  }
}
