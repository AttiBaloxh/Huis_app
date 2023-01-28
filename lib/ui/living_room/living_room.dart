import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../app_comp/represent_function.dart';
import '../../helper/app_colors/app_colors.dart';
import '../active_device/active_comp/single_switcher_comp.dart';

class LivingRoom extends StatelessWidget {
  const LivingRoom({super.key});

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
                    image: AssetImage("assets/images/living_room.webp")),
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
                                color: kPinkColor),
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
                "Living room",
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
              trailingTitle: "Turn on all",
              title: "Devices",
              lengthOfActiveDevice: 8,
            ),
            GridView.builder(
              itemCount: 10,
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              // scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return const SingleSwitcherComp();
              },
            ),
            // Container(
            //   color: Colors.blue,
            // ),
          ],
        ),
      ),
    );
  }
}
