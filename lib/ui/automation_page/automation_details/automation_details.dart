import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_comp/large_btn.dart';
import 'package:huis_light/app_comp/represent_function.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/ui/report_page/report_page.dart';

import '../../../helper/app_colors/app_colors.dart';

class AutomationDetails extends StatelessWidget {
  const AutomationDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LargeBTN(
            onPressed: () {
              pushToNextPage(context: context, className: const ReportPage());
            },
            btnTitle: "Save",
          ),
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Row(
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
                        border: Border.all(),
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "1",
                        style: TextStyle(
                          color: kPinkColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        " / 2",
                        style: TextStyle(
                          color: kBlack,
                          fontSize: 18,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const Center(),
                ],
              ),
            ),
            Text(
              "Go to Office",
              textAlign: TextAlign.center,
              style: TextStyle(
                decoration: TextDecoration.underline,
                decorationColor: kPinkColor,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const RepresentFunction(
              trailingTitle: "Add condition",
              title: "If",
              lengthOfActiveDevice: 2,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Container(
              height: 190,
              width: 280,
              margin: const EdgeInsets.symmetric(horizontal: 18.0),
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: kGrey1Color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/timer.svg",
                          color: const Color(0xff5B17EA),
                          height: 23,
                        ),
                      ],
                    ),
                    title: const Text(
                      "Schedule 09:30AM",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      "Mon, Thu",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: kPinkColor,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Divider(),
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/location_icon.svg",
                          color: const Color(0xffEA8917),
                          height: 23,
                        ),
                      ],
                    ),
                    title: const Text(
                      "Leave from",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: const Text(
                      "Jl. Candra, Jakarta Timur",
                      style: TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    trailing: CircleAvatar(
                      maxRadius: 15,
                      backgroundColor: kPinkColor,
                      child: const Icon(
                        Icons.close,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            GestureDetector(
              onTap: () {
                showModalBottomSheet<int>(
                  backgroundColor: Colors.transparent,
                  context: context,
                  builder: (context) {
                    return Container(
                      height: 500,
                      // color: Colors.lightBlue,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40.0,
                          ),
                          const RepresentFunction(
                            trailingTitle: "",
                            title: "Tasks",
                            lengthOfActiveDevice: 4,
                          ),
                          const SizedBox(
                            height: 24.0,
                          ),
                          const SingleTask(
                            icon: "device.svg",
                            title: "Run Device",
                            iconColor: Color(0xff00C5C5),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          const SingleTask(
                            icon: "active.svg",
                            title: "Run automations",
                            iconColor: Color(0xff5B17EA),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          const SingleTask(
                            icon: "notification_security.svg",
                            title: "Send notification",
                            iconColor: Color(0xffEA8917),
                          ),
                          const SizedBox(
                            height: 12.0,
                          ),
                          SingleTask(
                            icon: "break.svg",
                            title: "Delay the action",
                            iconColor: kPinkColor,
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              child: const RepresentFunction(
                trailingTitle: "Add task",
                title: "Then",
                lengthOfActiveDevice: 1,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Container(
              height: 100,
              width: 280,
              margin: const EdgeInsets.symmetric(horizontal: 18.0),
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: kGrey1Color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/icons/lock.svg",
                      color: const Color(0xff00C5C5),
                      height: 23,
                    ),
                  ],
                ),
                title: const Text(
                  "Close smart lock",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: const Text(
                  "Front gate",
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                trailing: CircleAvatar(
                  maxRadius: 15,
                  backgroundColor: kPinkColor,
                  child: const Icon(
                    Icons.close,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleTask extends StatelessWidget {
  final String icon, title;
  final Color iconColor;
  final bool? isSetting;
  const SingleTask(
      {super.key,
      required this.icon,
      this.isSetting,
      required this.title,
      required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 18.0),
      padding: const EdgeInsets.all(14.0),
      decoration: BoxDecoration(
        color: kGrey1Color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Row(
          children: [
            SvgPicture.asset(
              "assets/icons/$icon",
              color: iconColor,
              height: 23,
            ),
            const SizedBox(
              width: 12.0,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        trailing: Icon(
          isSetting == null ? Icons.add : Icons.arrow_forward_ios,
          color: kGreyColor,
        ),
      ),
    );
  }
}
