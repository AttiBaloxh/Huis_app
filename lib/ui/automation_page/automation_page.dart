import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_comp/represent_function.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/ui/automation_page/add_automation_page/add_automation_page.dart';
import 'package:huis_light/ui/automation_page/automation_log.dart';

import '../../helper/app_colors/app_colors.dart';
import '../../helper/static_values/static_values.dart';
import '../home_page/home_details/home_details.dart';

class AutomationPage extends StatefulWidget {
  const AutomationPage({super.key});

  @override
  State<AutomationPage> createState() => _AutomationPageState();
}

class _AutomationPageState extends State<AutomationPage> {
  bool _isShowOffcial = false;
  bool _isShowOff = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                    onTap: () {},
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
                            "Tebet",
                            style: TextStyle(
                              color: kBlack,
                            ),
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
                        pushToNextPage(context: context, className: const AddAutomationPage());
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: kBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderRadiusValue),
                        ),
                      ),
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            const Text(
              "Automation",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 6.0,
            ),
            Text(
              "Automate run task with some conditions.",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kGreyColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const Expanded(
                    child: SingleTopOption(
                      icon: "active.svg",
                      iconBottomText: "Active",
                      title: "7",
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        pushToNextPage(
                          context: context,
                          className: const AutomationLogs(),
                        );
                      },
                      child: const SingleTopOption(
                        icon: "logs.svg",
                        iconBottomText: "Logs",
                        title: "81",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            const RepresentFunction(
              trailingTitle: "Manage",
              title: "Automations",
              lengthOfActiveDevice: 12,
            ),
            const SizedBox(
              height: 12.0,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SingleAutomation(
                    icon: "active.svg",
                    iconColor: Color(0xff5B17EA),
                    title: "Morning Routine",
                  ),
                  SingleAutomation(
                    icon: "break.svg",
                    iconColor: kPinkColor,
                    title: "Coffe Break",
                  ),
                  const SingleAutomation(
                    icon: "notification_security.svg",
                    iconColor: Color(0xffEA8917),
                    title: "Security",
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              height: 170,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: kGrey1Color,
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/location_icon.svg",
                            color: const Color(0xffEA8917),
                            height: 23,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          SvgPicture.asset(
                            "assets/icons/timer.svg",
                            color: const Color(0xff5B17EA),
                            height: 23,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          SvgPicture.asset(
                            "assets/icons/arrow_right.svg",
                            color: kGreyColor,
                            height: 23,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          SvgPicture.asset(
                            "assets/icons/lock.svg",
                            height: 23,
                            color: const Color(0xff00C5C5),
                          ),
                        ],
                      ),
                      CupertinoSwitch(
                        value: _isShowOffcial,
                        activeColor: kPinkColor,
                        trackColor: kGreyColor,
                        onChanged: (value) {
                          setState(() {
                            _isShowOffcial = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    // color: const Color(0xff5B17EA),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Go to Office",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "1 task",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kGreyColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // color: Colors.red,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              height: 170,
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: kGrey1Color,
              ),
              width: double.infinity,
              padding: const EdgeInsets.all(14.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/icons/cloud.svg",
                            color: kPinkColor,
                            height: 23,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          SvgPicture.asset(
                            "assets/icons/arrow_right.svg",
                            color: kGreyColor,
                            height: 23,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          SvgPicture.asset(
                            "assets/icons/active.svg",
                            color: const Color(0xff5B17EA),
                            height: 23,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          SvgPicture.asset(
                            "assets/icons/break.svg",
                            height: 23,
                            color: kPinkColor,
                          ),
                          const SizedBox(
                            width: 6.0,
                          ),
                          SvgPicture.asset(
                            "assets/icons/notification_security.svg",
                            height: 23,
                            color: const Color(0xffEA8917),
                          ),
                        ],
                      ),
                      CupertinoSwitch(
                        value: _isShowOff,
                        activeColor: kPinkColor,
                        trackColor: kGreyColor,
                        onChanged: (value) {
                          setState(() {
                            _isShowOff = value;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    // color: const Color(0xff5B17EA),
                    width: double.infinity,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Go to Office",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "1 task",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kGreyColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              // color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}

class SingleAutomation extends StatelessWidget {
  final String title, icon;
  final Color iconColor;
  const SingleAutomation(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 160,
      margin: const EdgeInsets.only(left: 12.0),
      decoration: BoxDecoration(
        color: iconColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24.0),
      ),
      padding: const EdgeInsets.all(14.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SvgPicture.asset(
                "assets/icons/$icon",
                color: iconColor,
              ),
              Icon(
                Icons.more_horiz,
                color: kGreyColor,
              ),
            ],
          ),
          SizedBox(
            // color: const Color(0xff5B17EA),
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  "1 task",
                  // textAlign: TextAlign.center,
                  style: TextStyle(
                    color: kGreyColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
