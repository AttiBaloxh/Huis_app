import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/aircondition_sheet.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class SmartLampSheet extends StatefulWidget {
  const SmartLampSheet({super.key});

  @override
  State<SmartLampSheet> createState() => _SmartLampSheetState();
}

class _SmartLampSheetState extends State<SmartLampSheet> {
  Widget slider1 = SleekCircularSlider(
    appearance: CircularSliderAppearance(
      angleRange: 350,

      customWidths: CustomSliderWidths(trackWidth: 10.0, shadowWidth: 5.0),
      customColors: CustomSliderColors(
        dotColor: kwhite,
        trackColor: flashWhite,
        progressBarColors: [
          const Color(0xff8D17EA),
          const Color(0xff5B17EA),
          const Color(0xff8D17EA)
        ],
        shadowMaxOpacity: 20.0,
      ),
      // size: 20,
      infoProperties: InfoProperties(bottomLabelText: ''),
    ),
    initialValue: 22,
    onChange: (double value) {},
  );

  bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      minChildSize: 0.7,
      maxChildSize: 0.9,
      expand: false,
      initialChildSize: 0.7,
      builder: (BuildContext context, ScrollController scrollController) {
        return ListView(
          controller: scrollController,
          children: [
            Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 12, bottom: 20),
                    height: 3,
                    width: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: kPinkColor),
                  ),
                ],
              ),
            ),
            SwitchListTile.adaptive(
              value: isSelected,
              subtitle: const Text(
                "Philips A60",
              ),
              title: Text(
                "Smart Lamp",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlack,
                ),
              ),
              onChanged: (value) {
                setState(() {
                  isSelected = value;
                });
              },
              activeColor: Colors.red,
            ),
            Center(child: slider1),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          // border: Border.all(),

                          borderRadius: BorderRadius.circular(22),
                          color: Colors.black),
                      child: const Icon(
                        Icons.remove,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.ideographic,
                        children: [
                          Text(
                            "65",
                            style: TextStyle(
                              fontSize: 45,
                              fontWeight: FontWeight.bold,
                              color: kBlack,
                            ),
                          ),
                          const Text(
                            "%",
                            textAlign: TextAlign.justify,
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      Text(
                        "Brigtness",
                        style: TextStyle(
                          // fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kBlack,
                        ),
                      ),
                    ],
                  ),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                    onPressed: () {},
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          // border: Border.all(),

                          borderRadius: BorderRadius.circular(22),
                          color: Colors.black),
                      child: const Icon(
                        Icons.add,
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SingleBottomFeature(
                      icon: "timer2.svg",
                      iconBottomText: "Timer",
                      color: kGrey1Color,
                      title: "5",
                      subtitle: "hours",
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: SingleBottomFeature(
                      icon: "smartlamp.svg",
                      iconBottomText: "Lumen",
                      color: kGrey1Color,
                      title: "270",
                      subtitle: "lm",
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
