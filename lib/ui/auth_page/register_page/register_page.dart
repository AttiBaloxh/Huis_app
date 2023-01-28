import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_comp/custom_button.dart';
import 'package:huis_light/app_comp/custom_textfield.dart';
import 'package:huis_light/app_comp/social_button.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/ui/auth_page/verification_otp/verification_otp.dart';
import 'package:huis_light/ui/login_screen.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();

  bool validate = false;
  bool passwordValidate = false;

  @override
  void dispose() {
    email.dispose();
    super.dispose();
  }

  bool checkedValue = false;
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
                  padding: const EdgeInsets.symmetric(vertical: 24.0),
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
                  "Let’s get started 👇",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 28,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.060,
                ),
                CustomTextField(
                  controller: fullName,
                  hintText: 'Full Name',
                  validate: validate,
                  errorMessage: "Please Inter Valid Name",
                  isEye: false,
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
                CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  title: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 12,
                      ),
                      text: "I agree\t",
                      children: [
                        TextSpan(
                          text: "Privacy Policy\t",
                          style: TextStyle(color: kPinkColor),
                        ),
                        const TextSpan(text: "and\t"),
                        TextSpan(
                          text: "User Agreement",
                          style: TextStyle(color: kPinkColor),
                        ),
                      ],
                    ),
                  ),
                  value: checkedValue,

                  activeColor: kPinkColor,
                  onChanged: (newValue) {
                    setState(() {
                      checkedValue = newValue!;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                SizedBox(
                  height: size.height * 0.086,
                ),
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: CustomButton(
                    onPressed: () {
                      setState(() {
                        email.text.isEmpty ? validate = true : validate = false;
                        password.text.isEmpty
                            ? passwordValidate = true
                            : passwordValidate = false;
                      });
                      if (validate != true) {
                        pushToNextPage(
                          context: context,
                          className: const VerificationOTP(),
                        );
                      }
                    },
                    title: "Register",
                  ),
                ),
                SizedBox(
                  height: size.height * 0.020,
                ),
                Text(
                  "Or register with",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: kGreyColor,
                    fontSize: 12,
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
                      "Arleady have an account?",
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        pushToNextPage(
                          context: context,
                          className: const LoginScreen(),
                        );
                      },
                      child: const Text(
                        "Login",
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
