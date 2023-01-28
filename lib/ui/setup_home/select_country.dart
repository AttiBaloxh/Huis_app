import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:huis_light/app_comp/small_btn.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/helper/app_constant/country_data.dart';
import 'package:huis_light/helper/icons_data/icons_data.dart';
import 'package:huis_light/helper/static_values/static_values.dart';
import 'package:huis_light/models/country_model.dart';
import 'package:huis_light/ui/setup_home/select_home_name.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  CountryModel selectedIndex = CountryModel(countryFlag: "", countryTitle: "");

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
                const Center(
                  child: Text(
                    "Select your country👇",
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: "PlusSans",
                      fontWeight: FontWeight.w700,
                    ),
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
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search country",
                      border: InputBorder.none,
                      suffixIcon: Transform.scale(
                        scale: 0.5,
                        child: SvgPicture.asset(searchIcon, width: 20),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                Column(
                  children: countiesList
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15.0, vertical: 5),
                          child: ListTile(
                            shape: borderRadius,
                            tileColor:
                                selectedIndex.countryTitle == e.countryTitle
                                    ? kPinkColor
                                    : Colors.transparent,
                            onTap: () {
                              setState(() {
                                selectedIndex = e;
                              });
                            },
                            title: Row(
                              children: [
                                Center(
                                  child: CircleAvatar(
                                    backgroundColor: flashWhite,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: CircleAvatar(
                                        backgroundImage:
                                            AssetImage(e.countryFlag),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  e.countryTitle,
                                  style: TextStyle(
                                    color: selectedIndex.countryTitle ==
                                            e.countryTitle
                                        ? flashWhite
                                        : kBlack,
                                  ),
                                ),
                              ],
                            ),
                            trailing:
                                selectedIndex.countryTitle == e.countryTitle
                                    ? Icon(
                                        Icons.check_circle,
                                        color: flashWhite,
                                      )
                                    : null,
                          ),
                        ),
                      )
                      .toList(),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom:8.0),
              child: SmallBTN(
                onPressed: () {
                  pushToNextPage(
                    context: context,
                    className: const SelectHomeName(),
                  );
                },
              ),
            )
            // SizedBox(
            //   height: 60,
            //   width: 190,
            //   child: ElevatedButton(
            //     onPressed: () {},
            //     style: ElevatedButton.styleFrom(
            //       backgroundColor: Colors.black,
            //       shape: RoundedRectangleBorder(
            //         borderRadius: BorderRadius.circular(24),
            //       ),
            //     ),
            //     child: const Text(
            //       "Next",
            //       style: TextStyle(
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
