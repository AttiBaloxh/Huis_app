import 'package:flutter/material.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';

class LargeBTN extends StatelessWidget {
  final Function() onPressed;
  final String btnTitle;
  const LargeBTN({super.key, required this.onPressed, required this.btnTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SizedBox(
        height: 60,
        width: double.infinity,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: btnTitle == "Delete"
                ? kGrey1Color
                : btnTitle != "Continue setup home"
                    ? kBlack
                    : kPinkColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          child: Text(
            btnTitle,
            style:  TextStyle(
              color: btnTitle == "Delete" ? kPinkColor : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
