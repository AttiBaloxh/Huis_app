import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:huis_light/app_comp/aircondition_sheet.dart';
import 'package:huis_light/app_comp/cctv_sheet.dart';
import 'package:huis_light/app_comp/smart_lamp_sheet.dart';
import 'package:huis_light/app_comp/smart_tv_sheet.dart';

import '../../app_comp/represent_function.dart';
import '../../helper/app_colors/app_colors.dart';

class LivingRoom extends StatelessWidget {
  const LivingRoom({super.key});
  static List<Map<String, dynamic>> list = [
    {
      "icon": "smartlamps.svg",
      "title": "Smart Lamp",
      "substitle": "Warm",
    },
    {
      "icon": "aircondition.svg",
      "title": "Air Conditioner",
      "substitle": "",
    },
    {
      "icon": "smarttv.svg",
      "title": "Smart TV",
      "substitle": "",
    },
    {
      "icon": "cctv.svg",
      "title": "CCTV",
      "substitle": "",
    },
  ];

  static List<Widget> listWidget = [
    const SmartLampSheet(),
    const AirConditionSheet(),
    const SmartTvSheet(),
    const CCTVSheet(),
  ];
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
              itemCount: list.length,
              shrinkWrap: true,
              primary: false,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              // scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      builder: (context) => listWidget[index],
                    );
                  },
                  child: SingleSwitcher(
                    icon: list[index]["icon"],
                    title: list[index]["title"],
                    substitle: list[index]["substitle"],
                  ),
                );
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

class SingleSwitcher extends StatefulWidget {
  final String title, substitle, icon;
  const SingleSwitcher(
      {super.key,
      required this.icon,
      required this.substitle,
      required this.title});

  @override
  State<SingleSwitcher> createState() => _SingleSecurityCameraState();
}

class _SingleSecurityCameraState extends State<SingleSwitcher> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromRGBO(240, 240, 240, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ListTile(
            leading: const Text(
              "On",
              style: TextStyle(
                  color: Color.fromRGBO(234, 23, 99, 1),
                  fontWeight: FontWeight.bold,
                  fontSize: 19),
            ),
            trailing: CupertinoSwitch(
              value: state,
              onChanged: (value) {
                state = value;
                setState(
                  () {},
                );
              },
              activeColor: const Color.fromRGBO(234, 23, 99, 1),
            ),
          ),
          SvgPicture.asset("assets/icons/${widget.icon}"),
          Text(
            widget.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            widget.substitle,
            style: const TextStyle(
              color: Color.fromRGBO(128, 128, 128, 1),
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
