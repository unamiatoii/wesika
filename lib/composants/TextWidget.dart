import 'package:flutter/material.dart';

class MyPageView extends StatefulWidget {
  @override
  _MyPageViewState createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  // Defini le nombre de page que tu veux dans le PgeView
  final int pageCount = 5;

  // Recupere l'index de paage actuelle
  int currentPageIndex = 0;

  // Controller for the PageView
  PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PageView with Buttons'),
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int pageIndex) {
                // Callback when the page changes
                setState(() {
                  currentPageIndex = pageIndex;
                });
              },
              itemBuilder: (BuildContext context, int index) {
                // Return a widget to display at the current index
           
                return buildPage(index);
              },
              itemCount: pageCount,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  _goToPreviousPage();
                },
                child: Text('Previous'),
              ),
              ElevatedButton(
                onPressed: () {
                  _goToNextPage();
                },
                child: Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Function to build the pages at a given index
  Widget buildPage(int index) {
    // Customize the content of each page
    return Center(
      child: Text(
        'Page $index',
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }

  // Function to navigate to the previous page
  void _goToPreviousPage() {
    if (currentPageIndex > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  // Function to navigate to the next page
  void _goToNextPage() {
    if (currentPageIndex < pageCount - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }
}
