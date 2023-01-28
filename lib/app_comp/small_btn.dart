import 'package:flutter/material.dart';

class SmallBTN extends StatelessWidget {
  final Function () onPressed;
  const SmallBTN({super.key,required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: 190,
      child: ElevatedButton(
        onPressed:onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        child: const Text(
          "Next",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
