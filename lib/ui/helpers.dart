import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void showWarningScaffold(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.yellowAccent,
    ),
  );
}

void showSuccessScaffold(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.yellowAccent,
    ),
  );
}
