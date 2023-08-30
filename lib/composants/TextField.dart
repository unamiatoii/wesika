import 'package:flutter/material.dart';

Widget createTextFieldWithIcon(String hintText, String labelText,
    IconData iconData, TextEditingController controller) {
  return Builder(builder: (context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1.5),
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            color: Colors.white),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            iconColor: Theme.of(context).colorScheme.onPrimary,
            labelText: labelText,
            labelStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
            prefixIcon: Icon(
              iconData,
              color: Theme.of(context).colorScheme.secondary,
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            contentPadding: EdgeInsets.zero,
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  });
}
