import 'package:flutter/material.dart';
import 'package:my_app/Utils/font_text_style.dart';

class FormFieldStyle {
  static InputDecoration defaultSignInTextFieldStyle = InputDecoration(
    hintText: "Username",
    hintStyle: FontTextStyle.hintTextStyle,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white, width: 1.5),
    ),
  );

  static InputDecoration defaultPasswordTextFieldStyle = InputDecoration(
    hintText: "Password",
    hintStyle: FontTextStyle.hintTextStyle,
    fillColor: Colors.white,
    filled: true,
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white, width: 1.5),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white, width: 2),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: BorderSide(color: Colors.white.withOpacity(0.5), width: 1.5),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
      borderSide: const BorderSide(color: Colors.white, width: 1.5),
    ),
  );
}
