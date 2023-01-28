// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialButton extends StatelessWidget {
  final String svgPath;
  final Color buttonColor;
   Color? iconColor = Colors.white ;
  final Function()? onPressed;
   SocialButton({super.key,required this.svgPath, required this.onPressed,this.iconColor = Colors.white ,required this.buttonColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(22),
            color:buttonColor,
          ),
          child: Center(
            child: SvgPicture.asset(
              svgPath,
              color: iconColor
            ),
          ),
        ),
      ),
    );
  }
}
