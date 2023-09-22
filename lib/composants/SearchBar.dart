import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  final TextEditingController controller;
  final void Function(String) onChanged; 
  final String labelText;
  final IconData prefixIcon;

  const SearchField({
    required Key key,
    required this.controller,
    required this.onChanged,
    this.labelText = 'Rechercher',
    this.prefixIcon = Icons.search,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(
            prefixIcon,
            color: Theme.of(context).colorScheme.secondary,
          ),
          labelStyle: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
          ),
        ),
      ),
    );
  }
}
