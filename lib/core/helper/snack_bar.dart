import 'package:flutter/material.dart';

class ShowSnackBar {
  static void show({
    required BuildContext context,
    required String message,
    int? second,
    bool? isSuccess,
    Color color = Colors.transparent,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.w500,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        backgroundColor: isSuccess == true ? Colors.green : Colors.red,
        elevation: 1,
        duration: Duration(seconds: second ?? 3),
        behavior: SnackBarBehavior.floating,
      ),
    ).closed.then((value) {
      if (context.mounted) ScaffoldMessenger.of(context).clearSnackBars();
    });
  }
}
