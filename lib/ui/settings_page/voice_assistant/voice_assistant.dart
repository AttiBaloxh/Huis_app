import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_comp/represent_function.dart';

import '../../../helper/app_colors/app_colors.dart';

class VoiceAssistant extends StatelessWidget {
  const VoiceAssistant({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
              child: Row(
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
                ],
              ),
            ),
            const Text(
              "Voice assistant",
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
              "Select voice services below to control your devices\nusing your voice",
              textAlign: TextAlign.center,
              style: TextStyle(
                // fontSize: 28,
                color: kGreyColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            const RepresentFunction(
              trailingTitle: "",
              title: "Services",
              lengthOfActiveDevice: 4,
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 200,
                      // width: 120,
                      decoration: BoxDecoration(
                        color: kGrey1Color,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/google.svg",
                            // color: iconColor,
                            height: 40,
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          const Text(
                            "Google Assistant",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 200,

                      decoration: BoxDecoration(
                        color: kGrey1Color,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            "assets/icons/amazon.svg",
                            // color: iconColor,
                            height: 40,
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          const Text(
                            "Amazon Alexa",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
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
                  Expanded(
                    child: Container(
                      height: 200,
                      // width: 120,
                      decoration: BoxDecoration(
                        color: kGrey1Color,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/siri.png",
                            // color: iconColor,
                            height: 40,
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          const Text(
                            "Apple Siri",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 200,

                      decoration: BoxDecoration(
                        color: kGrey1Color,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      // padding: const EdgeInsets.symmetric(vertical: 24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/icons/samsung.png",
                            // color: iconColor,
                            height: 40,
                          ),
                          const SizedBox(
                            height: 50.0,
                          ),
                          const Text(
                            "Samsung Bixby",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
