import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/ui/add_device/device_location/device_locations.dart';

import '../../../app_comp/small_btn.dart';
import '../../../app_rought/app_rought.dart';
import '../../../helper/app_colors/app_colors.dart';

class LinkingDevice extends StatelessWidget {
  const LinkingDevice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SmallBTN(
              onPressed: () {
                pushToNextPage(
                    context: context, className: const DeviceLocations());
              },
            ),
          ),
        ],
      ),
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
          const Text(
            "Linking device 🔗",
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
            "Press and hold the reset button for 5s until\nthe indicator blinks.",
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontSize: 28,
              color: kGreyColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          Image.asset("assets/icons/linkingprocess.png"),
          const SizedBox(
            height: 46.0,
          ),
          const Text(
            "Connecting..",
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
            "36%",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: kPinkColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
    );
  }
}
