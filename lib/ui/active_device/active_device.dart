import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_comp/represent_function.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/helper/app_constant/single_room_data.dart';
import 'package:huis_light/media_quary/media_quary.dart';
import 'package:huis_light/models/single_room.dart';
import 'package:huis_light/ui/active_device/active_comp/search_comp.dart';
import 'package:huis_light/ui/active_device/active_comp/security_camera.dart';
import 'package:huis_light/ui/active_device/active_comp/single_switcher_comp.dart';

class ActiveDevice extends StatefulWidget {
  const ActiveDevice({super.key});

  @override
  State<ActiveDevice> createState() => _ActiveDeviceState();
}

class _ActiveDeviceState extends State<ActiveDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierColor: const Color(0xffdddddd).withOpacity(0.9),
                        builder: (_) => const SearchComp(),
                      );
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.black),
                      child: Transform.scale(
                        scale: 0.5,
                        child: SvgPicture.asset(
                          "assets/icons/search.svg",
                          color: kwhite,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Center(
                  child: Text(
                    "Active devices",
                    style: TextStyle(
                        color: kBlack,
                        fontSize: 28,
                        fontWeight: FontWeight.w700),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.014,
                ),
                RepresentFunction(
                  lengthOfActiveDevice: securityCameraActiveRoom.length,
                  trailingTitle: "See all",
                  title: "Security camera",
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.014,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: securityCameraActiveRoom.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        SingleActiveRoom securityCamera =
                            securityCameraActiveRoom[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SecurityCamera(
                            singleActiveRoom: securityCamera,
                          ),
                        );
                      }),
                ),
                const RepresentFunction(
                  lengthOfActiveDevice: 12,
                  trailingTitle: "Go to the room",
                  title: "Office",
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const SingleSwitcherComp();
                    },
                  ),
                ),
                const RepresentFunction(
                  lengthOfActiveDevice: 122,
                  trailingTitle: "Go to the room",
                  title: "Living Room",
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const SingleSwitcherComp();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
