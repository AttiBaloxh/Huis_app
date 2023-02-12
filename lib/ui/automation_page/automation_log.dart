
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/app_colors/app_colors.dart';
import '../../helper/app_colors/colors_utils.dart';
import '../../helper/static_values/static_values.dart';
import '../../helper/date_utils/date_utils.dart' as date_util;

class AutomationLogs extends StatefulWidget {
  const AutomationLogs({super.key});

  @override
  State<AutomationLogs> createState() => _AutomationLogsState();
}

class _AutomationLogsState extends State<AutomationLogs> {
  // DateTime _selectedValue = DateTime.now();
  double width = 0.0;
  double height = 0.0;
  late ScrollController scrollController;
  List<DateTime> currentMonthList = List.empty();
  DateTime currentDateTime = DateTime.now();
  List<String> todos = <String>[];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    currentMonthList = date_util.DateUtils.daysInMonth(currentDateTime);
    currentMonthList.sort((a, b) => a.day.compareTo(b.day));
    currentMonthList = currentMonthList.toSet().toList();
    scrollController =
        ScrollController(initialScrollOffset: 100.0 * currentDateTime.day);
    super.initState();
  }

  Widget hrizontalCapsuleListView() {
    return SizedBox(
      width: width,
      height: 120,
      child: ListView.builder(
        padding: const EdgeInsets.only(right: 12),
        controller: scrollController,
        scrollDirection: Axis.horizontal,
        // physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        itemCount: currentMonthList.length,
        itemBuilder: (BuildContext context, int index) {
          return capsuleView(index);
        },
      ),
    );
  }

  Widget capsuleView(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currentDateTime = currentMonthList[index];
        });
      },
      child: Container(
        width: 100,
        // height: 80,
        margin: const EdgeInsets.only(left: 12),
        decoration: BoxDecoration(
          color: (currentMonthList[index].day == currentDateTime.day)
              ? const Color(0xff00C5C5)
              : kGrey1Color,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                currentMonthList[index].day.toString(),
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? HexColor("465876")
                        : Colors.white),
              ),
              Text(
                date_util
                    .DateUtils.weekdays[currentMonthList[index].weekday - 1],
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: (currentMonthList[index].day != currentDateTime.day)
                        ? HexColor("465876")
                        : Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle style = const TextStyle(color: Colors.white);
  final List<Events> listOfEvents = [
    Events(
        time: "12:54",
        icon: "cctvicon.svg",
        eventName: "CCTV Security",
        description: "Someone detected"),
    Events(
        time: "09:32",
        eventName: "Notification",
        icon: "notification_security.svg",
        description: "Your package has arrived"),
    Events(
        time: "06:21",
        eventName: "Go to Office",
        icon: "lock.svg",
        description: "Front gate opened"),
    Events(
      time: "05:30",
      eventName: "CCTV Security",
      icon: "cctvicon.svg",
      description: "Someone detected",
    ),
  ];

  final List<Color> listOfColors = [
    Constants.kPurpleColor,
    Constants.kGreenColor,
    Constants.kRedColor
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        borderRadius: BorderRadius.circular(22)),
                    child: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () async {
                      DateTime selectedDate = DateTime.now();

                      final DateTime? picked = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2015, 8),
                          lastDate: DateTime(2101));
                      if (picked != null && picked != selectedDate) {
                        setState(() {
                          selectedDate = picked;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      backgroundColor: kBlack,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(borderRadiusValue),
                      ),
                    ),
                    child: SvgPicture.asset(
                      "assets/icons/datetime.svg",
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 36.0,
          ),
          const Text(
            "Automation logs",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          hrizontalCapsuleListView(),
          const SizedBox(
            height: 24.0,
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: listOfEvents.length,
              itemBuilder: (context, i) {
                return Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 30, left: 25),
                      child: Row(
                        children: [
                          // SizedBox(width: size.width * 0.1),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 40.0, bottom: 10),
                            child: SizedBox(
                              width: size.width * 0.13,
                              child: Text(listOfEvents[i].time),
                            ),
                          ),
                          const SizedBox(
                            width: 12.0,
                          ),
                          Container(
                              height: 100,
                              width: 280,
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: kGrey1Color,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/icons/${listOfEvents[i].icon}",
                                        height: 23,
                                      ),
                                      const SizedBox(
                                        width: 18.0,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            listOfEvents[i].eventName,
                                            style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(listOfEvents[i].description),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              )),
                          // SizedBox(
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(listOfEvents[i].eventName),
                          //       Text(
                          //         listOfEvents[i].description,
                          //         style: const TextStyle(
                          //             color: Colors.grey, fontSize: 12),
                          //       )
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ),
                    Positioned(
                      left: 50,
                      child: Container(
                        height: size.height * 0.7,
                        width: 1.0,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(40.0),
                        child: Container(
                          height: 15.0,
                          margin: const EdgeInsets.only(left: 3.0),
                          width: 15.0,
                          decoration: BoxDecoration(
                            color: kPinkColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }),
        ],
      ),
    );
  }
}

class Events {
  final String time;
  final String eventName;
  final String icon;
  final String description;

  Events(
      {required this.time,
      required this.icon,
      required this.eventName,
      required this.description});
}

class Constants {
  static const kPurpleColor = Color(0xFFB97DFE);
  static const kRedColor = Color(0xFFFE4067);
  static const kGreenColor = Color(0xFFADE9E3);
}
