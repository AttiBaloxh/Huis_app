import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/large_btn.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/ui/add_device/device_location/single_device_location.dart';
import 'package:huis_light/ui/kitchen_page/kitchen_page.dart';
import 'package:huis_light/ui/living_room/living_room.dart';

import '../../../app_comp/represent_function.dart';
import '../../../helper/app_colors/app_colors.dart';
import '../../home_page/home_details/home_details.dart';

class DeviceLocations extends StatelessWidget {
  const DeviceLocations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: LargeBTN(
              onPressed: () {},
              btnTitle: 'Save',
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
                      "2",
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
            "Device location📍",
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
            "Select a home and a room for your device.",
            textAlign: TextAlign.center,
            style: TextStyle(
              // fontSize: 28,
              color: kGreyColor,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 36.0,
          ),
          GestureDetector(
            onTap: () {
              pushToNextPage(context: context, className: const KitchenPage());
            },
            child: const RepresentFunction(
              lengthOfActiveDevice: 2,
              trailingTitle: "See all",
              title: "Home",
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          SizedBox(
            height: 250,
            child: ListView.builder(
              itemCount: 1,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) => const SingleDeviceLocation(),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          GestureDetector(
            onTap: () {
              pushToNextPage(context: context, className: const LivingRoom());
            },
            child: const RepresentFunction(
              trailingTitle: "See all",
              title: "Rooms",
              lengthOfActiveDevice: 6,
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: const [
                  SingleRoomHomeDetails(),
                  SingleRoomHomeDetails(),
                  SingleRoomHomeDetails(),
                  SingleRoomHomeDetails(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
        ],
      ),
    );
  }
}
