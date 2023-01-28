import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:huis_light/app_rought/app_rought.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';
import 'package:huis_light/ui/auth_page/register_done/register_done.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';

class VerificationOTP extends StatefulWidget {
  const VerificationOTP({super.key});

  @override
  State<VerificationOTP> createState() => _VerificationOTPState();
}

class _VerificationOTPState extends State<VerificationOTP> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Column(
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
                  height: 50,
                ),
                Column(
                  children: [
                    Text(
                      "Enter the\nverification code 🔒 ",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kBlack,
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "A 5 digit verification code has been sent to your\nregistered email address.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kGreyColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                OTPTextField(
                  length: 5,
                  fieldStyle: FieldStyle.box,
                  width: MediaQuery.of(context).size.width,
                  fieldWidth: 50,
                  style: const TextStyle(fontSize: 17),
                  keyboardType: TextInputType.number,
                  textFieldAlignment: MainAxisAlignment.spaceAround,
                  outlineBorderRadius: 50,
                  onCompleted: (pin) {
                    pushToNextPage(
                      context: context,
                      className: const RegisterDone(),
                    );
                  },
                  otpFieldStyle: OtpFieldStyle(
                    borderColor: Colors.black,
                  ),
                ),
              ],
            ),
            RichText(
              text: TextSpan(
                style: TextStyle(
                  color: kBlack,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                text: "Didn’t receive the code?\t",
                children: [
                  TextSpan(
                    text: "Send again",
                    style: TextStyle(
                      color: kPinkColor,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
