import 'package:flutter/material.dart';
import 'package:wesika/composants/NextPage.dart';
import 'package:wesika/main.dart';
import 'package:wesika/pages/mainPage/HomePage.dart';
import 'package:wesika/pages/mainPage/NouvelleTontinePage.dart';
import 'package:wesika/pages/mainPage/RejoindreTontinePage.dart';

class MyBottomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final currentPage = ModalRoute.of(context)!.settings.name;
    // Remplacez 'HomePage', 'RejoindreTontinePage', etc. par les noms de vos pages.
    final isHomePage = currentPage == '/';
    final isRejoindreTontinePage = currentPage == '/rejoindreTontine';
    final isNouvelleTontinePage = currentPage == '/nouvelleTontine';

    return BottomAppBar(
      color: Colors.white,
      elevation: 0,
      shape: CircularNotchedRectangle(),
      notchMargin: 8.0,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          botttomAppBarIconButton(context, Icons.home, MyHomePage(),
              isActive: isHomePage),
          botttomAppBarIconButton(context, Icons.search, RejoindreTontinePage(),
              isActive: isRejoindreTontinePage),
          botttomAppBarIconButton(context, Icons.add, NouvelleTontineWidget(),
              isActive: isNouvelleTontinePage),
          botttomAppBarIconButton(context, Icons.notifications, MyHomePage()),
          botttomAppBarIconButton(context, Icons.account_circle, MyHomePage()),
        ],
      ),
    );
  }
}

Widget botttomAppBarIconButton(
    BuildContext context, IconData icon, Widget nextpage,
    {bool isActive = false}) {
  final color = isActive
      ? Theme.of(context).colorScheme.secondary
      : Theme.of(context).colorScheme.onPrimary;

  return IconButton(
    icon: Icon(
      icon,
      size: 30,
      color: color,
    ),
    onPressed: () {
      if (!isActive) {
        changePage(context, Home(nextPage: nextpage));
      }
    },
  );
}
