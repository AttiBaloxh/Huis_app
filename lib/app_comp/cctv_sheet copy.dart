import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';

class CCTVSheet extends StatefulWidget {
  const CCTVSheet({super.key});

  @override
  State<CCTVSheet> createState() => _CCTVSheetState();
}

class _CCTVSheetState extends State<CCTVSheet> {
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
                "Mi home security camera",
              ),
              title: Text(
                "CCTV",
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
            Container(
              height: 400,
              width: double.infinity,
              margin: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/badroom.jpg"),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 35,
                      width: 130,
                      child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 7,
                                backgroundColor: kPinkColor,
                              ),
                              const SizedBox(
                                width: 12.0,
                              ),
                              Text(
                                "Recording",
                                style: TextStyle(
                                  color: kBlack,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Container(
                    height: 100,
                    // color: ,
                    decoration: BoxDecoration(
                      color: kGrey1Color,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SvgPicture.asset("assets/icons/mute_sound.svg"),
                        SvgPicture.asset("assets/icons/camera.svg"),
                        SvgPicture.asset("assets/icons/next.svg"),
                        SvgPicture.asset("assets/icons/full_screen.svg"),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
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
                      child: Transform.scale(
                        scale: 0.5,
                        child: SvgPicture.asset(
                          "assets/icons/records.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 180,
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      decoration: BoxDecoration(
                          color: kGrey1Color,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Icon(Icons.keyboard_arrow_up),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: const [
                                  Icon(Icons.keyboard_arrow_left),
                                  Icon(Icons.keyboard_arrow_right),
                                ],
                              ),
                              const Icon(Icons.keyboard_arrow_down),
                            ],
                          ),
                          Draggable(
                            data: 'Flutter',
                            feedback: Container(
                              height: 80,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff00C5C5),
                                      Color(0xff00ADC5),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            childWhenDragging: Container(),
                            child: Container(
                              height: 80,
                              width: 80,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                color: Colors.white,
                              ),
                              child: Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                  gradient: const LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color(0xff00C5C5),
                                      Color(0xff00ADC5),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      // width: double.infinity,
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
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
                      child: Transform.scale(
                        scale: 0.5,
                        child: SvgPicture.asset(
                          "assets/icons/more.svg",
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24.0,
            ),
          ],
        );
      },
    );
  }
}
