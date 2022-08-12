import 'package:flutter/material.dart';

SnackBar showSnackbar(String text) {
  return SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    duration: const Duration(milliseconds: 1500),
    behavior: SnackBarBehavior.floating,
  );
}
