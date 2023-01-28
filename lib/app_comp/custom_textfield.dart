// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText ;
  final String errorMessage;
  bool ? isEye = false;
   bool? validate = false;
  CustomTextField({super.key, required this.controller, required this.errorMessage, this.isEye, this.validate,required this.hintText});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
     bool eye = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: TextField(
        controller: widget.controller,
        obscureText: widget.isEye! ==false?false:eye,
        decoration: InputDecoration(
            isDense: true,
            contentPadding: const EdgeInsets.all(20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(32.0),
            ),
            fillColor: widget.validate == true
                ? Colors.pink.withOpacity(0.3)
                : const Color(0xffF0F0F0),
            filled: true,
            hintText: widget.hintText,
            errorText: widget.validate! ? widget.errorMessage : null,
            suffixIcon:widget.isEye==false?null: IconButton(
              onPressed: () {
                setState(() {
                  eye = !eye;
                });
              },
              icon: Icon(
                eye == true
                    ? Icons.visibility_sharp
                    : Icons.visibility_off_sharp,
                color: Colors.black,
              ),
            )),
      ),
    );
  }
}
