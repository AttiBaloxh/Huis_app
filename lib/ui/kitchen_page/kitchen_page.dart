import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_comp/represent_function.dart';
import '../../helper/app_colors/app_colors.dart';

class KitchenPage extends StatelessWidget {
  const KitchenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/kitchen.jpeg"),
                ),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                // border: Border.all(),

                                borderRadius: BorderRadius.circular(22),
                                color: Colors.black),
                            child: Transform.scale(
                              scale: 0.5,
                              child: SvgPicture.asset(
                                "assets/icons/edit_icon.svg",
                                color: kwhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                // border: Border.all(),

                                borderRadius: BorderRadius.circular(22),
                                color: kBlack),
                            child: Image.asset("assets/icons/pin.png")),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Center(
              child: Text(
                "Kitchen",
                style: TextStyle(
                  color: kBlack,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const RepresentFunction(
              trailingTitle: "Add device",
              title: "Devices",
              lengthOfActiveDevice: 0,
            ),
            const SizedBox(
              height: 36,
            ),
            Center(
              child: Column(
                children: [
                  Stack(
                    children: [
                      Opacity(
                        opacity: 0.2,
                        child: Image.asset(
                          "assets/images/caution.png",
                          color: Colors.black,
                          height: 110,
                        ),
                      ),
                      ClipRect(
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                          child: Image.asset(
                            "assets/images/caution.png",
                            height: 110,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "No devices",
                    style: TextStyle(
                      color: kBlack,
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    "You haven't added a device. You need to add \ndevice first by clicking “Add device",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            )
            // Container(
            //   color: Colors.blue,
            // ),
          ],
        ),
      ),
    );
  }
}
