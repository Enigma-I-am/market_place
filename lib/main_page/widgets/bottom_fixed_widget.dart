import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:market_place/utils/extensions.dart';

class BottomFixedWidget extends StatelessWidget {
  const BottomFixedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          vertical: context.screenHeight(.04),
          horizontal: context.screenWidth(.06)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                      fontSize: 18,
                      // TODO: grey text
                      color: Color(0xff868992),
                    ),
                  ),
                  Gap(10),
                  Text(
                    "\$18.00",
                    style: TextStyle(
                        fontSize: 28,
                        color: Color(0xff2A977D),
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Container(
                    height: context.screenHeight(.07),
                    width: context.screenWidth(.2),
                    decoration: const BoxDecoration(
                      // TODO: primary
                      color: Color(0xff4AB299),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset(
                          'shopping-bag'.svg,
                          colorFilter: const ColorFilter.mode(
                            Colors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        const Text(
                          "1",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: context.screenHeight(.07),
                    width: context.screenWidth(.3),
                    decoration: const BoxDecoration(
                      // TODO:dark
                      color: Color(0xff2A2D40),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                    ),
                    child: const Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
