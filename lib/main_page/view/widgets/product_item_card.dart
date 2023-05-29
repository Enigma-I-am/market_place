import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:market_place/utils/extensions.dart';

class ProductItemCard extends StatelessWidget {
  const ProductItemCard({
    super.key,
    required this.randomRating,
    required this.randomSales,
    required this.randomPrice,
    required this.index,
  });

  final double randomRating;
  final int randomSales;
  final int randomPrice;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: context.screenHeight(.13),
              width: double.infinity,
              decoration: const BoxDecoration(color: Color(0xffEEEEEF)),
              child: Stack(
                children: [
                  Positioned.fill(
                    top: -40,
                    bottom: -60,
                    child: Image.network(
                      "https://firebasestorage.googleapis.com/v0/b/flutterxfirestore.appspot.com/o/hoodie-removebg-preview.png?alt=media&token=40af9516-97af-4ef3-9b20-9a0c0e01a4b4",
                      fit: BoxFit.contain,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: context.screenWidth(.015),
              top: context.screenWidth(.02),
              child: SvgPicture.asset(
                'heart'.svg,
                height: context.screenWidth(.05),
              ),
            )
          ],
        ),
        const Gap(10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Shirt",
                style:
                    // TODO: color grey
                    TextStyle(
                        fontSize: 14,
                        color: Color(
                          0xffBEBFC3,
                        ),
                        fontWeight: FontWeight.w500),
              ),
              SizedBox(height: context.screenHeight(.0075)),
              const Text(
                "Essentials Men's Long-Sleeve Crewneck T-Shirt",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const Gap(10),
              Row(
                children: [
                  SvgPicture.asset(
                    "star".svg,
                    // TODO: star color
                    color: const Color(
                      0xffEA9A3B,
                    ),
                    width: context.screenWidth(.03),
                  ),
                  Text(
                    " ${randomRating.toStringAsFixed(1)} | $randomSales",
                    style: const TextStyle(
                      // TODO: grey text
                      fontSize: 14,
                      color: Color(
                        0xff868992,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    "\$$randomPrice.00",
                    style: const TextStyle(
                      fontSize: 18,
                      // TODO: Primary color
                      color: Color(
                        0xff4AB299,
                      ),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}