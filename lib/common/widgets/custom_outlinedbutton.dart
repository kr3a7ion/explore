import 'package:flutter/material.dart';

SizedBox customOutlinedButton({
  double theWidth = 73,
  String imagePath = '',
  double theImageHeight = 20,
  required String theButtonText,
  required bool useIcon,
  IconData theIconPath = Icons.abc,
  double theiconSize = 20,
  required Function() onPressed,
}) {
  return SizedBox(
    height: 40,
    width: theWidth,
    child: IconButton.outlined(
        style: ButtonStyle(
            side: WidgetStatePropertyAll(BorderSide(
              width: 0.2,
              color: const Color.fromARGB(228, 134, 134, 134),
            )),
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4)))),
        onPressed: onPressed,
        icon: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 10,
          children: [
            useIcon
                ? Icon(theIconPath, size: theiconSize)
                : Image.asset(imagePath, height: theImageHeight),
            Text(theButtonText,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
          ],
        )),
  );
}
