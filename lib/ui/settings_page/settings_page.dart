import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:huis_light/app_comp/represent_function.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/helper/static_values/static_values.dart';
import 'package:huis_light/ui/automation_page/automation_details/automation_details.dart';
import 'package:huis_light/ui/settings_page/profile_page/profile_page.dart';
import 'package:huis_light/ui/settings_page/voice_assistant/voice_assistant.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                        onPressed: () async {
                          pushToNextPage(
                            context: context,
                            className: const ProfilePage(),
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
                        child: SvgPicture.asset("assets/icons/editicon.svg")),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SizedBox(
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: kBlack,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(borderRadiusValue),
                        ),
                      ),
                      child:
                          SvgPicture.asset("assets/icons/settings_icons.svg"),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(
                      "https://i.pinimg.com/564x/31/44/7e/31447e25b7bc3429f83520350ed13c15.jpg",
                    ),
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        "George Martin",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                      Text(
                        "george123@email.com",
                        style: TextStyle(
                            // fontSize: 20.0,
                            // fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            ListTile(
              title: Text(
                "Quick action",
                style: TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  "Manage",
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
            const SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  const SingleQuickAction(
                    icon: "smartlock.svg",
                    iconColor: Color(0xff5B17EA),
                    title: "Lock home",
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SingleQuickAction(
                    icon: "device_off.svg",
                    iconColor: kYellowColor,
                    title: "Disable all",
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SingleQuickAction(
                    icon: "flash_off.svg",
                    iconColor: kPinkColor,
                    title: "Off energy",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16.0,
            ),
            const RepresentFunction(
                trailingTitle: "", title: "General", lengthOfActiveDevice: 3),
            const SizedBox(
              height: 16.0,
            ),
            GestureDetector(
              onTap: () {
                pushToNextPage(
                    context: context, className: const VoiceAssistant());
              },
              child: SingleTask(
                isSetting: true,
                icon: "records.svg",
                title: "Voice assistant",
                iconColor: kPinkColor,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            SingleTask(
              isSetting: true,
              icon: "notification_security.svg",
              title: "Notification",
              iconColor: kYellowColor,
            ),
            const SizedBox(
              height: 12.0,
            ),
            const SingleTask(
              isSetting: true,
              icon: "question_mark.svg",
              title: "FAQ & feedback",
              iconColor: Color(0xff00C5C5),
            ),
            const SizedBox(
              height: 12.0,
            ),
          ],
        ),
      ),
    );
  }
}

class SingleQuickAction extends StatelessWidget {
  final String title, icon;
  final Color iconColor;
  const SingleQuickAction(
      {super.key,
      required this.icon,
      required this.iconColor,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 130,
        width: 120,
        decoration: BoxDecoration(
          color: kGrey1Color,
          borderRadius: BorderRadius.circular(30),
        ),
        // padding: const EdgeInsets.symmetric(vertical: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/icons/$icon",
              color: iconColor,
              height: 23,
            ),
            const SizedBox(
              height: 24.0,
            ),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
