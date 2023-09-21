import 'package:flutter/material.dart';
import 'package:wesika/composants/Buttons.dart';
import 'package:wesika/pages/Acceuil/Login.dart';
import 'package:wesika/pages/Acceuil/Register.dart';
import 'package:wesika/pages/Acceuil/RegisterMode.dart';

import '../../composants/NextPage.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController controller = PageController();
  bool onLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              children: const [
                OnBoard(),
              ],
            ),
            Align(
                alignment: Alignment(0, 0.85),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buttons(
                        context: context,
                        texte: "S'INSCRIRE",
                        onPressed: () {
                          changePage(context, ChooseRegistrationMethodPage());
                        },
                        height: 45,
                        backcolor: Theme.of(context).colorScheme.onPrimary,
                        bordercolor: Theme.of(context).colorScheme.secondary),
                    buttons(
                        context: context,
                        texte: "SE CONNECTER",
                        onPressed: () {
                          changePage(context, LoginPage());
                        },
                        height: 45,
                        backcolor: Theme.of(context).colorScheme.secondary,
                        bordercolor: Theme.of(context).colorScheme.onPrimary),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class OnBoard extends StatelessWidget {
  const OnBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.primary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/wesika_sans_bg.png')],
      ),
    );
  }
}
