import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/large_btn.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/bottom_page/bottom_page.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';

class AddRoom extends StatefulWidget {
  const AddRoom({super.key});

  @override
  State<AddRoom> createState() => _AddRoomState();
}

class _AddRoomState extends State<AddRoom> {
  void showBottomSheet() {
    showModalBottomSheet(
      context: context,
      barrierColor: const Color(0xffdddddd).withOpacity(0.9),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      backgroundColor: Colors.white,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Setup home\ncompleted 🎉 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: TextStyle(color: kGreyColor, fontSize: 12),
                    text: "You can add another home from\n",
                    children: [
                      TextSpan(
                        text: "Manage home",
                        style: TextStyle(
                            color: kPinkColor,
                            decoration: TextDecoration.underline),
                      ),
                      const TextSpan(
                        text: "menu.",
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                LargeBTN(
                  btnTitle: "Continue setup home",
                  onPressed: () {
                    pushToNextPage(
                      context: context,
                      className: const BottomPage(),
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kwhite,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: CupertinoButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            border: Border.all(),
                            borderRadius: BorderRadius.circular(22)),
                        child: const Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Center(
                  child: Text(
                    "Add rooms 🛋",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "PlusSans",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.only(left: 20),
                          decoration: BoxDecoration(
                            color: flashWhite,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              hintText: "Room name",
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          color: kPinkColor,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Icon(
                          Icons.add,
                          color: kwhite,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SingleRoom(),
                const SingleRoom(),
                const SingleRoom(),
              ],
            ),
            SafeArea(
              child: LargeBTN(
                btnTitle: "Next",
                onPressed: () {
                  showBottomSheet();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SingleRoom extends StatelessWidget {
  const SingleRoom({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      minVerticalPadding: 25,
      dense: true,
      leading: const CircleAvatar(
        radius: 30,
      ),
      title: Text(
        "Office",
        style: TextStyle(
          color: kBlack,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
      ),
      trailing: CircleAvatar(
        radius: 14,
        backgroundColor: kPinkColor,
        child: Center(
          child: Icon(
            Icons.close,
            size: 14,
            color: kwhite,
          ),
        ),
      ),
    );
  }
}
