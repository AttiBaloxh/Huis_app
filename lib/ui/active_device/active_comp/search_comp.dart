import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_comp/represent_function.dart';
import 'package:huis_light/ui/active_device/active_comp/single_switcher_comp.dart';

import '../../../helper/app_colors/app_colors.dart';
import '../../../helper/static_values/static_values.dart';

class SearchComp extends StatefulWidget {
  const SearchComp({super.key});

  @override
  State<StatefulWidget> createState() => SearchCompState();
}

class SearchCompState extends State<SearchComp>
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
      child: Column(
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
         searchController.text.isEmpty? const SizedBox(): Material(
            color: Colors.transparent,
            child: Column(
              children: [
                const RepresentFunction(
                  lengthOfActiveDevice: 12,
                  trailingTitle: "Go to the room",
                  title: "Office",
                ),
                SizedBox(
                  height: 170,
                  child: ListView.builder(
                    itemCount: 2,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return const SingleSwitcherComp();
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
