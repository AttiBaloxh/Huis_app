import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_comp/represent_function.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/helper/static_values/static_values.dart';
import 'package:huis_light/ui/add_device/device_security/device_security.dart';
import 'package:huis_light/ui/add_device/search_device/search_device.dart';
import 'package:huis_light/ui/scan_qr_page/scan_qr_page.dart';

class AddDevicePage extends StatelessWidget {
  const AddDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: ListView(
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
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        pushToNextPage(
                            context: context, className: const ScanQRCode());
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
                            "assets/icons/scan_icon.svg",
                            color: kwhite,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        showDialog(
                          context: context,
                          barrierColor:
                              const Color(0xffdddddd).withOpacity(0.9),
                          builder: (_) => const SearchDevice(),
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
              ],
            ),
          ),
          Column(
            children: [
              const Text(
                "Add device",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                "Auto scanning nearby devices",
                style: TextStyle(
                  fontSize: 12,
                  color: kGreyColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: 240,
                  child: Image.asset(
                    "assets/images/add_device.png",
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Add a device manually",
                  style: TextStyle(
                    fontSize: 16,
                    // color: kwhite,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const RepresentFunction(
                trailingTitle: "",
                title: "Lighting",
                lengthOfActiveDevice: 14,
              ),
              GridView.count(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                children: const [
                  SingleLightManually(
                    title: "Smart lamp",
                    icon: "smart_lamp.svg",
                  ),
                  SingleLightManually(
                    title: "Desk lamp",
                    icon: "desklamp.svg",
                  ),
                  SingleLightManually(
                    title: "Outdoor lamp",
                    icon: "outdoor_lamp.svg",
                  ),
                  SingleLightManually(
                    title: "Light bulb",
                    icon: "bulb.svg",
                  ),
                ],
              ),
              const SizedBox(
                height: 12.0,
              ),
              const RepresentFunction(
                trailingTitle: "",
                title: "Security",
                lengthOfActiveDevice: 7,
              ),
              GridView.count(
                primary: false,
                shrinkWrap: true,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 2.5,
                children: [
                  GestureDetector(
                    onTap: () {
                      pushToNextPage(
                          context: context, className: const DeviceSecurity());
                    },
                    child: const SingleLightManually(
                      title: "Video camera",
                      icon: "videocamera.svg",
                    ),
                  ),
                  const SingleLightManually(
                    title: "Smart lock",
                    icon: "smartlock.svg",
                  ),
                  const SingleLightManually(
                    title: "Outdoor lamp",
                    icon: "outdoor_lamp.svg",
                  ),
                  const SingleLightManually(
                    title: "Light bulb",
                    icon: "bulb.svg",
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}

class SingleLightManually extends StatelessWidget {
  final String title, icon;
  const SingleLightManually(
      {super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadiusValue),
        color: const Color(0xffF0F0F0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(right: title == "Smart lamp" ? 10 : 0),
            child: SvgPicture.asset(
              "assets/icons/$icon",
            ),
          ),
          const SizedBox(
            width: 12.0,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
