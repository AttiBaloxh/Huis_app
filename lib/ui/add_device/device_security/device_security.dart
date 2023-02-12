import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/ui/add_device/linking_device/linking_device.dart';

import '../../../app_comp/represent_function.dart';
import '../../../app_rought/app_rought.dart';

class DeviceSecurity extends StatelessWidget {
  const DeviceSecurity({super.key});

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
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  "Security",
                  style: TextStyle(
                    color: kBlack,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const Center(),
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const RepresentFunction(
            lengthOfActiveDevice: 8,
            trailingTitle: "",
            title: "Video camera",
          ),
          const SizedBox(
            height: 12.0,
          ),
          GridView.builder(
            primary: false,
            shrinkWrap: true,
            padding: const EdgeInsets.all(16),
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 12, crossAxisSpacing: 12, crossAxisCount: 2),
            itemBuilder: (context, index) => GestureDetector(
              onTap: () {
                pushToNextPage(
                    context: context, className: const LinkingDevice());
              },
              child: Container(
                decoration: BoxDecoration(
                    color: kGrey1Color,
                    borderRadius: BorderRadius.circular(20.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/bulb.png"),
                    const SizedBox(
                      height: 12.0,
                    ),
                    const Text(
                      "Yeelight 1S smart\nbulb",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
