import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/small_btn.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/ui/automation_page/automation_details/automation_details.dart';

import '../../../helper/app_colors/app_colors.dart';

class AddSchedulePage extends StatefulWidget {
  const AddSchedulePage({super.key});

  @override
  State<AddSchedulePage> createState() => _AddSchedulePageState();
}

class _AddSchedulePageState extends State<AddSchedulePage> {
  static List<String> list = <String>['Mon, Thu', 'Two', 'Three', 'Four'];
  String dropdownValue = list[0];
  static List<String> selectTime = <String>[
    'PM',
    'AM',
  ];
  String dropdownSelectTimeValue = selectTime[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SmallBTN(onPressed: () {
            pushToNextPage(context: context, className: const AutomationDetails());
          }),
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          borderRadius: BorderRadius.circular(22)),
                      child: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // const Center(),
                ],
              ),
            ),
            const SizedBox(
              height: 36.0,
            ),
            const Text(
              "Schedule🗓",
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
              "Set the time to execute the automation",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: kGreyColor,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 18.0,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "Repeat days",
                style: TextStyle(
                  color: kBlack,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: DropdownButtonFormField<String>(
                value: dropdownValue,
                decoration: InputDecoration(
                  fillColor: kGrey1Color,
                  filled: true,
                  contentPadding: const EdgeInsets.all(24.0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: BorderSide.none,
                  ),
                ),
                onChanged: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            ListTile(
              title: Text(
                "Execution time",
                style: TextStyle(
                  color: kBlack,
                  fontWeight: FontWeight.bold,
                ),
              ),
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  "Reset",
                  // "See all",
                  style: TextStyle(
                    color: kPinkColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (context) => SizedBox(
                            height: 200,
                            child: CupertinoDatePicker(
                              mode: CupertinoDatePickerMode.time,
                              backgroundColor: Colors.white,
                              initialDateTime: DateTime.now(),
                              onDateTimeChanged: (DateTime newDateTime) {
                                var newTod = TimeOfDay.fromDateTime(newDateTime);
                                // _updateTimeFunction(newTod);
                              },
                              use24hFormat: false,
                              minuteInterval: 1,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 70,
                        // width: 100,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.only(left: 12.0),
                        decoration: BoxDecoration(
                          color: kGrey1Color,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: const Text("06"),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6.0,
                  ),
                  const Text(":"),
                  const SizedBox(
                    width: 6.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      // width: 100,
                      alignment: Alignment.centerLeft,
                      padding: const EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                        color: kGrey1Color,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: const Text("30"),
                    ),
                  ),
                  const SizedBox(
                    width: 12.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 70,
                      // width: 120,
                      // alignment: Alignment.centerLeft,
                      // padding: const EdgeInsets.only(left: 12.0),
                      decoration: BoxDecoration(
                        color: kGrey1Color,
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      child: DropdownButtonFormField<String>(
                        value: dropdownSelectTimeValue,
                        decoration: InputDecoration(
                          fillColor: kGrey1Color,
                          filled: true,
                          // contentPadding: const EdgeInsets.all(24.0),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownSelectTimeValue = value!;
                          });
                        },
                        items: selectTime
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
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
