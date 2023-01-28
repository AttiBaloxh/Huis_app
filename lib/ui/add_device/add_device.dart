import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_comp/represent_function.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/ui/active_device/active_comp/search_comp.dart';

class AddDevicePage extends StatelessWidget {
  const AddDevicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
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
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {
                          showDialog(
                            context: context,
                            barrierColor:
                                const Color(0xffdddddd).withOpacity(0.9),
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
            SizedBox(
              height: 240,
              child: Image.asset(
                "assets/images/add_device.png",
              ),
            ),
            const Text(
              "Add a device manually",
              style: TextStyle(
                fontSize: 16,
                // color: kwhite,
                fontWeight: FontWeight.w700,
              ),
            ),
            const RepresentFunction(
              trailingTitle: "",
              title: "Lighting",
              lengthOfActiveDevice: 14,
            )
          ],
        ),
      ),
    );
  }
}
