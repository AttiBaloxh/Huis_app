import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/small_btn.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/ui/setup_home/select_address.dart';

class SelectHomeName extends StatefulWidget {
  const SelectHomeName({super.key});

  @override
  State<SelectHomeName> createState() => _SelectHomeNameState();
}

class _SelectHomeNameState extends State<SelectHomeName> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Center(
                  child: Column(
                    children: [
                      const Text(
                        "Your home name 🏠",
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: "PlusSans",
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        "Choose a nickname for this home to help\nidentify it later.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            color: kGreyColor),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.only(left: 20),
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: flashWhite,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Select Home Name",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
            SmallBTN(
              onPressed: () {
                pushToNextPage(
                  context: context,
                  className: const SelectHomeAddress(),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
