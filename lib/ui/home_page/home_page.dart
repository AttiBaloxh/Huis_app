import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/helper/static_values/static_values.dart';
import 'package:huis_light/media_quary/media_quary.dart';
import 'package:huis_light/test_ui/custom_dialog.dart';
import 'package:huis_light/ui/active_device/active_device.dart';

//${SizeConfig.screenHeight! * 0.4}
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? newValue = 'Tebet';

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            SizedBox(
              height: SizeConfig.screenHeight! * 0.4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Center(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                              "https://i.pinimg.com/564x/31/44/7e/31447e25b7bc3429f83520350ed13c15.jpg",
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            showDialog(
                              context: context,
                              barrierColor:
                                  const Color(0xffdddddd).withOpacity(0.9),
                              builder: (_) => const LogoutOverlay(
                                alignTopCenter: true,
                                firstIcon: "",
                                firstTitle: "",
                                secondIcon: "",
                                secondTitle: "",
                              ),
                            );
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffF0F0F0),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  newValue!,
                                  style: TextStyle(color: kBlack),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_drop_down,
                                  color: kBlack,
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                          child: ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                barrierColor:
                                    const Color(0xffdddddd).withOpacity(0.9),
                                builder: (_) => const LogoutOverlay(
                                  firstTitle: "Add home",
                                  firstIcon: "add_device.svg",
                                  secondTitle: "Scan invitation",
                                  secondIcon: "scan_icon.svg",
                                  alignTopCenter: false,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              backgroundColor: kBlack,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(borderRadiusValue),
                              ),
                            ),
                            child: const Icon(Icons.add,color: Colors.white,),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: const [
                      Text(
                        "Hello George 👋",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Welcome to your home.",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: const [
                        SingleUsedItem(
                          title: "27",
                          bgColor: Color(0xff5b17ea),
                          bottomTitle: "Jakarta",
                        ),
                        SingleUsedItem(
                          title: "13",
                          bgColor: Color(0xffEA1763),
                          bottomTitle: "Active\nDevices",
                        ),
                        SingleUsedItem(
                          title: "312",
                          bgColor: Color(0xffEA8917),
                          bottomTitle: "Usage",
                        ),
                        SingleUsedItem(
                          title: "312",
                          bgColor: Color(0xffEA8917),
                          bottomTitle: "Usage",
                        ),
                        SingleUsedItem(
                          title: "312",
                          bgColor: Color(0xffEA8917),
                          bottomTitle: "Usage",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.014,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundColor: kBlack,
                child: Text(
                  "6",
                  style: TextStyle(color: kwhite),
                ),
              ),
              title: Text(
                "Rooms",
                style: TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  "Add Room",
                  // "See all",
                  style: TextStyle(
                    color: kPinkColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.016,
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
                    "No rooms",
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
                    "You haven't added a room. You need to add \nrooms first by clicking “Add room”",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 12,
                      color: kGreyColor,
                    ),
                  ),
                ],
              ),
            )
            // Transform.scale(
            //   scale: 0.2,
            //   child: Image.asset(
            //     "assets/images/caution.png",

            //   ),
            // )
            // SvgPicture.asset("assets/icons/caution_svg.svg")
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     children: const [
            //       SingleRoom(),
            //       SingleRoom(),
            //       SingleRoom(),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class SingleUsedItem extends StatelessWidget {
  final Color bgColor;
  final String title;
  final String bottomTitle;
  const SingleUsedItem(
      {super.key,
      required this.bgColor,
      required this.title,
      required this.bottomTitle});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushToNextPage(
          context: context,
          className: const ActiveDevice(),
        );
      },
      child: Container(
        height: SizeConfig.screenHeight! * 0.18,
        width: SizeConfig.screenWidth! * 0.3,
        margin:
            EdgeInsets.symmetric(horizontal: SizeConfig.screenWidth! * 0.015),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(borderRadiusValue),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SvgPicture.asset("assets/icons/cloude.svg"),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  title == "27"
                      ? "${SizeConfig.screenHeight! * 0.18}"
                      // °C"
                      : title == "312"
                          ? "kwh"
                          : "",
                  style: TextStyle(
                    color: kwhite,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            Text(
              bottomTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12,
                color: kwhite,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleRoom extends StatelessWidget {
  const SingleRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: SizeConfig.screenWidth! * 0.02),
      height: SizeConfig.screenHeight! * 0.34 - 2,
      width: SizeConfig.screenWidth! * 0.4 + 4,
      decoration: BoxDecoration(
        color: kGrey1Color,
        borderRadius: BorderRadius.circular(borderRadiusValue),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(borderRadiusValue),
                  topRight: Radius.circular(borderRadiusValue),
                ),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://content.wepik.com/statics/2679643/empty-office-white-room-zoom-background-r-1201757360page1.jpg",
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset("assets/icons/office_icon.svg"),
                Text(
                  "Office",
                  style: TextStyle(
                      color: kBlack, fontWeight: FontWeight.w700, fontSize: 12),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: kBlack,
                          fontWeight: FontWeight.w700,
                        ),
                        text: "5\t",
                        children: [
                          TextSpan(
                            text: "Devices",
                            style: TextStyle(
                                color: kGreyColor, fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: kBlack,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        text: "1\t",
                        children: [
                          TextSpan(
                            text: "On",
                            style: TextStyle(
                              color: kPinkColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
