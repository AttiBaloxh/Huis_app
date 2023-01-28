import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/custom_button.dart';
import 'package:huis_light/app_comp/custom_textfield.dart';
import 'package:huis_light/app_comp/social_button.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/ui/auth_page/register_page/register_page.dart';

import 'quick_login_fingerprint.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final email = TextEditingController();
  final password = TextEditingController();

  bool validate = false;
  bool passwordValidate = false;

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
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
                      CupertinoButton(
                        padding: EdgeInsets.zero,
                        onPressed: () {},
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(22),
                              color: Colors.black),
                          child: const Icon(
                            Icons.question_mark,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                const Text(
                  "Welcome back 👋",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.060,
                ),
                CustomTextField(
                  controller: email,
                  hintText: 'Email',
                  validate: validate,
                  errorMessage: "*email not found",
                  isEye: false,
                ),
                CustomTextField(
                  controller: password,
                  hintText: 'Password',
                  validate: validate,
                  errorMessage: "*password is empty",
                  isEye: true,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Recovery password",
                        style: TextStyle(
                          color: Colors.pink,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.086,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 60,
                        child: CustomButton(
                          onPressed: () {
                            setState(() {
                              email.text.isEmpty
                                  ? validate = true
                                  : validate = false;
                              password.text.isEmpty
                                  ? passwordValidate = true
                                  : passwordValidate = false;
                            });
                          },
                          title: "Login",
                        ),
                      ),
                    ),
                    SizedBox(
                      width: size.width * 0.020,
                    ),
                    Expanded(
                      child: SizedBox(
                        height: 60,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      const QuickLoginFingerPrintScreen()));
                            },
                            child: const Center(
                              child: Icon(
                                Icons.fingerprint,
                              ),
                            )),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                const Text(
                  "Or login with",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SocialButton(
                      onPressed: () {},
                      iconColor: null,
                      buttonColor: const Color(0xffF0F0F0),
                      svgPath: "assets/icons/Variant=Google.svg",
                    ),
                    SocialButton(
                      buttonColor: Colors.blue,
                      onPressed: () {},
                      svgPath: "assets/icons/Variant=Facebook.svg",
                    ),
                    SocialButton(
                      buttonColor: Colors.black,
                      onPressed: () {},
                      svgPath: "assets/icons/Variant=Apple.svg",
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.040,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        pushToNextPage(
                          context: context,
                          className: const RegisterPage(),
                        );
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                          color: Colors.pink,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
