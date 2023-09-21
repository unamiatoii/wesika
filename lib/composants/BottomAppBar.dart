import 'package:flutter/material.dart';
import 'package:wesika/composants/NextPage.dart';
import 'package:wesika/main.dart';
import 'package:wesika/pages/mainPage/HomePage.dart';

class MyBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          botttomAppBarIconButton(context, Icons.home),
          botttomAppBarIconButton(context, Icons.search),
          botttomAppBarIconButton(context, Icons.add),
          botttomAppBarIconButton(context, Icons.notifications),
          botttomAppBarIconButton(context, Icons.account_circle),
        ],
      ),
    );
  }
}

Widget botttomAppBarIconButton(BuildContext context, IconData icon) {
  return IconButton(
    icon: Icon(
      icon,
      size: 30,
      color: Theme.of(context).colorScheme.onPrimary,
    ),
    onPressed: () {
      changePage(context, Home(nextPage: MyHomePage()));
    },
  );
}
