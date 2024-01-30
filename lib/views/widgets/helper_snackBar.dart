import 'package:flutter/material.dart';

void helperSnackBar({required BuildContext context, required String message}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
    ),
  );
}
