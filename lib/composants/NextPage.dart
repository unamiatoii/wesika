import 'package:flutter/material.dart';

changePage(BuildContext context, Widget nextPage) {
  return Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => nextPage));
}
