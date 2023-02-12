import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_comp/represent_function.dart';

import '../../../helper/app_colors/app_colors.dart';
import '../../../helper/static_values/static_values.dart';
import '../add_device.dart';

class SearchDevice extends StatefulWidget {
  const SearchDevice({super.key});

  @override
  State<StatefulWidget> createState() => SearchDeviceState();
}

class SearchDeviceState extends State<SearchDevice>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation<double>? scaleAnimation;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller!, curve: Curves.elasticInOut);

    controller!.addListener(() {
      setState(() {});
    });
    searchController.addListener(() {
      setState(() {});
    });

    controller!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: ListView(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: ScaleTransition(
                scale: scaleAnimation!,
                child: Container(
                  height: 60,
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.only(left: 20),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 65),
                  decoration: BoxDecoration(
                    color: kwhite,
                    borderRadius: BorderRadius.circular(borderRadiusValue),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Transform.scale(
                            scale: 0.4,
                            child: SvgPicture.asset("assets/icons/search.svg"),
                          ),
                        ),
                        hintStyle: TextStyle(color: kGreyColor),
                        hintText: "Search devices or room",
                      ),
                    ),
                  ),
                ),
              ),
            ),
            searchController.text.isEmpty
                ? const SizedBox()
                : Column(
                    children: [
                      Material(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            const RepresentFunction(
                              lengthOfActiveDevice: 1,
                              trailingTitle: "",
                              title: "Category",
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
                              ],
                            ),
                          ],
                        ),
                      ),
                      Material(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            const RepresentFunction(
                              lengthOfActiveDevice: 3,
                              trailingTitle: "",
                              title: "Devices",
                            ),
                            GridView.count(
                              primary: false,
                              shrinkWrap: true,
                              padding: const EdgeInsets.all(16),
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              crossAxisCount: 2,
                              childAspectRatio: 1.0,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
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
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/icons/bulb3.png"),
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      const Text(
                                        "Philips A60 wifi\nsmart bulb",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(20.0)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset("assets/icons/bulb2.png"),
                                      const SizedBox(
                                        height: 12.0,
                                      ),
                                      const Text(
                                        "Yeelight GU10 smart\nbulb",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
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
