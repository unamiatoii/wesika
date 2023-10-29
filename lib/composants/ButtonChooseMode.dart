import 'package:flutter/material.dart';

class BtnRegistrationMode extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color iconColor;
  final IconData iconData;

  BtnRegistrationMode({
    required this.onPressed,
    required this.text,
    required this.iconColor,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Container(
          height: 50,
          width: 320,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(12.0),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(
                iconData,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
              Text(
                text,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onPrimary,
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
