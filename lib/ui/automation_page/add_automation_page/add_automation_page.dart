import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:huis_light/app_comp/represent_function.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/ui/automation_page/add_schedule_page/add_schedule_page.dart';

import '../../../helper/app_colors/app_colors.dart';

class AddAutomationPage extends StatelessWidget {
  const AddAutomationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
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
                          borderRadius: BorderRadius.circular(22)),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // const Center(),
                ],
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            const Text(
              "Create automation",
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
              "Automate run task with some conditions",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kGreyColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            const RepresentFunction(
              trailingTitle: "",
              title: "Conditions",
              lengthOfActiveDevice: 4,
            ),
            const SizedBox(
              height: 12.0,
            ),
            SingleListTile(
              icon: "cloud.svg",
              substitle: "Run devices when temperature changes",
              title: "Weather changes",
              iconColor: kPinkColor,
            ),
            const SizedBox(
              height: 12.0,
            ),
            const SingleListTile(
              icon: "location_icon.svg",
              substitle: "Run devices when you leave or arrive",
              title: "Location changes",
              iconColor: Color(0xffEA8917),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const SingleListTile(
              icon: "timer.svg",
              substitle: "Run devices in spesific time",
              title: "Schedule",
              iconColor: Color(0xff5B17EA),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const SingleListTile(
              icon: "tap.svg",
              substitle: "Run devices only with one tap",
              title: "Tap to run",
              iconColor: Color(0xff00C5C5),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleListTile extends StatelessWidget {
  final String title, icon, substitle;
  final Color iconColor;
  const SingleListTile(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.substitle,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        pushToNextPage(context: context, className: const AddSchedulePage());
      },
      child: Container(
        height: 100,
        width: 280,
        margin: const EdgeInsets.symmetric(horizontal: 18.0),
        padding: const EdgeInsets.all(14.0),
        decoration: BoxDecoration(
          color: kGrey1Color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          leading: SvgPicture.asset(
            "assets/icons/$icon",
            color: iconColor,
            height: 23,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(
            substitle,
            style: const TextStyle(
              fontSize: 12,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
