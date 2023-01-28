import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/represent_function.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/ui/home_page/edit_address/edit_address.dart';
import 'package:huis_light/ui/home_page/home_details/home_details.dart';
import 'package:huis_light/ui/home_page/home_preview/single_home_list.dart';

import '../../../test_ui/custom_dialog.dart';

class MangeHomeDevice extends StatefulWidget {
  const MangeHomeDevice({super.key});

  @override
  State<MangeHomeDevice> createState() => _MangeHomeDeviceState();
}

class _MangeHomeDeviceState extends State<MangeHomeDevice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        borderRadius: BorderRadius.circular(22)),
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
                      builder: (_) => const LogoutOverlay(
                        firstTitle: "Add home",
                        firstIcon: "add_room.svg",
                        secondTitle: "Scan invitation",
                        secondIcon: "scan_icon.svg",
                        alignTopCenter: false,
                      ),
                    );
                    // pushToNextPage(context: context, className: const HomeDetails());
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(22),
                      color: Colors.black,
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
          Center(
            child: Text(
              "Manage home",
              style: TextStyle(
                color: kBlack,
                fontSize: 28,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          GestureDetector(
            onTap: () => pushToNextPage(
                context: context, className: const EditAddress()),
            child: const RepresentFunction(
              trailingTitle: "Select",
              title: "Home List",
              lengthOfActiveDevice: 12,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),

          GestureDetector(
            onTap: () => pushToNextPage(
                context: context, className: const HomeDetails()),
            child: const SingleHomeList(
              isScan: false,
            ),
          ),

          /////// HARD WORK<,,,,,,
        ],
      ),
    );
  }
}
