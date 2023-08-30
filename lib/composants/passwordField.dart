import 'package:flutter/material.dart';

class createPasswordFieldWithIcon extends StatefulWidget {
  final String hintText;
  final String labelText;
  final IconData iconData;
  final TextEditingController controller;

  const createPasswordFieldWithIcon({
    required this.hintText,
    required this.labelText,
    required this.iconData,
    required this.controller,
  });

  @override
  _createPasswordFieldWithIconState createState() =>
      _createPasswordFieldWithIconState();
}

class _createPasswordFieldWithIconState
    extends State<createPasswordFieldWithIcon> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black,width: 1.5),
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
          color: Colors.white,
        ),
        child: TextField(
          
          controller: widget.controller,
          obscureText: _obscureText,
          decoration: InputDecoration(
            labelText: widget.labelText,
            prefixIcon: Icon(
              widget.iconData,
              color: Theme.of(context).colorScheme.secondary,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).colorScheme.secondary,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            contentPadding: EdgeInsets.zero,
            hintText: widget.hintText,
            floatingLabelBehavior: FloatingLabelBehavior.never,
          ),
        ),
      ),
    );
  }
}
