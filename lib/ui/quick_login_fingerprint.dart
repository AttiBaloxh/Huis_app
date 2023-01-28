import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/custom_button.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';

class QuickLoginFingerPrintScreen extends StatelessWidget {
  const QuickLoginFingerPrintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
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
                ],
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              const Text(
                "Quick login 🔒 ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("Use Touch ID to login to your account. "),
              SizedBox(
                height: size.height * 0.1,
              ),
              Image.asset("assets/images/Frame.png"),
              SizedBox(
                height: size.height * 0.1,
              ),
              const Text(
                "Scanning..",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "70%",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 28,
                  color: kPinkColor,
                ),
              ),
              SizedBox(
                height: size.height * 0.1,
              ),
              SizedBox(
                width: double.infinity,
                child: CustomButton(
                  onPressed: () {},
                  title: "Login",
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
