import 'package:flutter/material.dart';
import 'package:huis_light/helper/app_colors/app_colors.dart';

class RepresentFunction extends StatelessWidget {
  final String title;
  final String trailingTitle;
  final int lengthOfActiveDevice;
  const RepresentFunction({
    super.key,
    required this.trailingTitle,
    required this.title,
    required this.lengthOfActiveDevice,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: kBlack,
        child: Text(
          lengthOfActiveDevice.toString(),
          style: TextStyle(color: kwhite),
        ),
      ),
      title: Text(
        title,
        style: TextStyle(
          color: kBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
      trailing: TextButton(
        onPressed: () {},
        child: Text(
          trailingTitle,
          // "See all",
          style: TextStyle(
            color: kPinkColor,
            fontSize: 12,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
    );
  }
}
