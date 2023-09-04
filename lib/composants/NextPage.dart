import 'package:flutter/material.dart';

changePage(BuildContext context, Widget nextPage) {
  return Navigator.push(
      context, MaterialPageRoute(builder: (context) => nextPage));
}
