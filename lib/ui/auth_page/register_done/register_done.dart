import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/large_btn.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/ui/login_screen.dart';
import 'package:huis_light/ui/setup_home/select_country.dart';

class RegisterDone extends StatefulWidget {
  const RegisterDone({super.key});

  @override
  State<RegisterDone> createState() => _RegisterDoneState();
}

class _RegisterDoneState extends State<RegisterDone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
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
            Image.asset(
              "assets/images/register_done.png",
              height: 400,
            ),
            Column(
              children: [
                const Text(
                  "Hurray\nyour account is now\nregistered 🎉 ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Congratulation, you are now registered. Do you\nwant to set up your home first?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: kGreyColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            LargeBTN(
                onPressed: () {
                  pushToNextPage(
                    context: context,
                    className: const SelectCountry(),
                  );
                },
                btnTitle: "Continue setup home"),
            const SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "No, I want to",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {
                    pushToNextPage(
                      context: context,
                      className: const LoginScreen(),
                    );
                  },
                  child: Text(
                    "Start exploring",
                    style: TextStyle(
                      color: kPinkColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
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
