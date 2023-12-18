import 'package:flutte_gym_app/_common/my_colors.dart';
import 'package:flutter/material.dart';

InputDecoration getAuthenticationInputDecoration(String label){
  return InputDecoration(
    label: Text(label),
    fillColor: Colors.white,
    filled: true,
    contentPadding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(48),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(48),
      borderSide: BorderSide(color: Colors.black, width: 2),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(48),
      borderSide: const BorderSide(color: MyColors.GreenTopGradient, width: 4),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(48),
      borderSide: const BorderSide(color: Colors.red, width: 4),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(48),
      borderSide: const BorderSide(color: Colors.red, width: 4),
    ),
  );
}