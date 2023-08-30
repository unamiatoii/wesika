import 'package:flutter/material.dart';
import 'package:wesika/main.dart';
import 'package:wesika/pages/Acceuil/Login.dart';
import 'package:wesika/pages/Acceuil/Register.dart';

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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => RegisterPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        foregroundColor: Colors.white,
                        disabledForegroundColor:
                            Theme.of(context).colorScheme.secondary,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                        minimumSize: const Size(150, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              20), // Ajustez le rayon selon vos préférences
                        ),
                      ).copyWith(
                        side: MaterialStateProperty.all<BorderSide>(
                          BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text("COMMENCER"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        foregroundColor:
                            Theme.of(context).colorScheme.onPrimary,
                        disabledForegroundColor:
                            Theme.of(context).colorScheme.secondary,
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                        minimumSize: const Size(150, 45),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ).copyWith(
                        side: MaterialStateProperty.all<BorderSide>(
                         const BorderSide(
                            color: Colors.black,
                            width: 2,
                          ),
                        ),
                      ),
                      child: const Text("SE CONNECTER"),
                    ),
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
      decoration: BoxDecoration(color: Theme.of(context).colorScheme.onPrimary),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset('assets/wesika_sans_bg.png')],
      ),
    );
  }
}
