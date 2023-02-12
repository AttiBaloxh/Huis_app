import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:huis_light/app_comp/custom_textfield.dart';

import '../../../app_comp/large_btn.dart';
import '../../../helper/app_colors/app_colors.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool validate = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kGrey1Color,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          LargeBTN(
            onPressed: () {},
            btnTitle: "Save",
          ),
          const SizedBox(
            height: 12.0,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/profile.jpeg")),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.baseline,
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
                              color: kwhite,
                              borderRadius: BorderRadius.circular(22),
                            ),
                            child: const Icon(
                              Icons.arrow_back_ios_new,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          onPressed: () {},
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                // border: Border.all(),

                                borderRadius: BorderRadius.circular(22),
                                color: Colors.black),
                            child: Transform.scale(
                              scale: 0.5,
                              child: SvgPicture.asset(
                                "assets/icons/upload.svg",
                                color: kwhite,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),
            Center(
              child: Text(
                "George Martin",
                style: TextStyle(
                  color: kBlack,
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(
              height: 12.0,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: Column(
                children: [
                  CustomTextField(
                    controller: email,
                    hintText: 'Email',
                    validate: validate,
                    isBorder: false,
                    errorMessage: "*email not found",
                    isEye: false,
                  ),
                  CustomTextField(
                    controller: password,
                    hintText: 'Password',
                    validate: validate,
                    isBorder: false,
                    errorMessage: "*password is empty",
                    isEye: true,
                  ),
                  const SizedBox(
                    height: 6.0,
                  ),
                  Container(
                    height: 63,
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 10,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "12/5/2000",
                          style: TextStyle(
                            color: kGreyColor,
                          ),
                        ),
                        const Icon(Icons.arrow_drop_down)
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   color: Colors.blue,
            // ),
          ],
        ),
      ),
    );
  }
}
