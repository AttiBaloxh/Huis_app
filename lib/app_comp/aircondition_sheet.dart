import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../ui/settings_page/settings_page.dart';

class AirConditionSheet extends StatefulWidget {
  const AirConditionSheet({super.key});

  @override
  State<AirConditionSheet> createState() => _AirConditionSheetState();
}

class _AirConditionSheetState extends State<AirConditionSheet> {
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
      infoProperties: InfoProperties(bottomLabelText: '°Celcius'),
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
                "Samsung AR18",
              ),
              title: Text(
                "Air conditioner",
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
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const SingleQuickAction(
                    icon: "cooling.svg",
                    iconColor: Color(0xff5B17EA),
                    title: "Cooling",
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SingleQuickAction(
                    icon: "heating.svg",
                    iconColor: kPinkColor,
                    title: "Heating",
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SingleQuickAction(
                    icon: "airwave.svg",
                    iconColor: kYellowColor,
                    title: "Airwave",
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12.0,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: SingleBottomFeature(
                      icon: "timer2.svg",
                      iconBottomText: "Timer",
                      color: kGrey1Color,
                      title: "12",
                      subtitle: "hours",
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: SingleBottomFeature(
                      icon: "humidity.svg",
                      iconBottomText: "Humidity",
                      color: kGrey1Color,
                      title: "40",
                      subtitle: "%",
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

class SingleBottomFeature extends StatelessWidget {
  final String icon, iconBottomText, title, subtitle;
  final Color color;

  const SingleBottomFeature({
    super.key,
    required this.icon,
    required this.iconBottomText,
    required this.color,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(24),
      ),
      height: 100,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SvgPicture.asset("assets/icons/$icon"),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      iconBottomText,
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Column(
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: kBlack,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
