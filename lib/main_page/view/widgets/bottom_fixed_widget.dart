import 'package:flutter/material.dart';
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
          vertical: context.screenHeight(.04), horizontal: context.screenWidth(.06)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total Price",
                    style: TextStyle(
                        fontSize: context.screenWidth(.04),
                        // TODO: grey text
                        color:const  Color(0xff868992),),
                  ),
                  SizedBox(
                    height: context.screenHeight(.01),
                  ),
                  Text(
                    "\$18.00",
                    style: TextStyle(
                        fontSize: context.screenWidth(.07),
                        color: const Color(0xff2A977D),
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
                            topLeft: Radius.circular(10))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // const IconWidget(
                        //   name: ImageUtil.purse,
                        //   color: Colors.white,
                        // ),
                        Text(
                          "1",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: context.screenWidth(.05)),
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
                            topRight: Radius.circular(10))),
                    child: Center(
                      child: Text(
                        "Buy Now",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: context.screenWidth(.05)),
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
