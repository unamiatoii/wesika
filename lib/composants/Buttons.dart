import 'package:flutter/material.dart';

Widget buttons({
  required BuildContext context,
  required String texte,
  required double height,
  required double width,
  required Function onPressed,
  required Color backcolor,
  required Color bordercolor,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
    child: ElevatedButton(
      onPressed: () {
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: backcolor,
        textStyle: const TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ).copyWith(
        side: MaterialStateProperty.all<BorderSide>(
          BorderSide(
            color: bordercolor,
            width: 2.0,
          ),
        ),
      ),
      child: Text(
        texte,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
        ),
      ),
    ),
  );
}
