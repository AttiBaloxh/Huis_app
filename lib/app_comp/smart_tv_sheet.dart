import 'package:flutter/material.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';

import '../ui/settings_page/settings_page.dart';

class SmartTvSheet extends StatefulWidget {
  const SmartTvSheet({super.key});

  @override
  State<SmartTvSheet> createState() => _SmartTvSheetState();
}

class _SmartTvSheetState extends State<SmartTvSheet> {
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
                "LG C1 Oled",
              ),
              title: Text(
                "Smart TV",
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
            const SizedBox(
              height: 24.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 156,
                  width: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: kBlack,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        color: kwhite,
                      ),
                      Text(
                        'VOL',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kwhite,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: kwhite,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  width: 200,
                  child: CircularShadow(
                    child: ClipOval(
                      child: ColoredBox(
                        color: Theme.of(context).cardColor,
                        child: GridView(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsetsDirectional.zero,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          children: [
                            const SizedBox.shrink(),
                            ArrowButton(
                              icon: Icons.arrow_drop_up_rounded,
                              onPress: () {},
                            ),
                            const SizedBox.shrink(),
                            ArrowButton(
                              icon: Icons.arrow_left_rounded,
                              onPress: () {},
                            ),
                            OkButton(
                              onPress: () {},
                            ),
                            ArrowButton(
                              icon: Icons.arrow_right_rounded,
                              onPress: () {},
                            ),
                            const SizedBox.shrink(),
                            ArrowButton(
                              icon: Icons.arrow_drop_down_rounded,
                              onPress: () {},
                            ),
                            const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 156,
                  width: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: kBlack,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.arrow_drop_up,
                        color: kwhite,
                      ),
                      Text(
                        'CH',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: kwhite,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        color: kwhite,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  const SingleQuickAction(
                    icon: "mute_sound.svg",
                    iconColor: Color(0xff00C5C5),
                    title: "Mute",
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  const SingleQuickAction(
                    icon: "next.svg",
                    iconColor: Color(0xff5B17EA),
                    title: "Play",
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SingleQuickAction(
                    icon: "records.svg",
                    iconColor: kPinkColor,
                    title: "Assistant",
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
                    icon: "back.svg",
                    iconColor: Color(0xff5B17EA),
                    title: "Back",
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SingleQuickAction(
                    icon: "home.svg",
                    iconColor: kPinkColor,
                    title: "Home",
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  SingleQuickAction(
                    icon: "more.svg",
                    iconColor: kYellowColor,
                    title: "Menu",
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class ArrowButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;

  const ArrowButton({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPress: onPress,
      child: Icon(
        icon,
        size: 64,
        color: Colors.grey,
      ),
    );
  }
}

class OkButton extends StatelessWidget {
  final VoidCallback onPress;

  const OkButton({
    Key? key,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      onPress: onPress,
      child: Container(
        color: Colors.grey.withOpacity(.1),
        child: const Center(
          child: Text(
            'OK',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

class BaseButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPress;
  final Color? backgroundColor;

  const BaseButton({
    Key? key,
    required this.child,
    required this.onPress,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Material(
        shadowColor: Colors.transparent,
        color: backgroundColor,
        child: InkWell(
          onTap: onPress,
          child: child,
        ),
      ),
    );
  }
}

class CircularShadow extends StatelessWidget {
  final Widget child;
  final double? blur;
  final double? shadowOpacity;

  const CircularShadow({
    Key? key,
    required this.child,
    this.blur,
    this.shadowOpacity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1000),
        boxShadow: [
          BoxShadow(
            color:
                Theme.of(context).shadowColor.withOpacity(shadowOpacity ?? .1),
            blurRadius: blur ?? 5,
          ),
        ],
      ),
      child: child,
    );
  }
}
