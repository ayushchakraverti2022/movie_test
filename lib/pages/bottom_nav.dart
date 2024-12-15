import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';
import 'package:movie_test/colors/color.dart';
import 'package:movie_test/pages/search.dart';

import 'home.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentPage = 0;
  final _pageController = PageController();
 
  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BottomNav oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [Home(), Search()],
        onPageChanged: (index) {
          // Use a better state management solution
          // setState is used for simplicity
          setState(() => _currentPage = index);
        },
      ),
      bottomNavigationBar: Material(
        elevation: 5,
        child: BottomBar(
          backgroundColor: CustomColor.White(),
          // showActiveBackgroundColor: true,
          selectedIndex: _currentPage,
          onTap: (int index) {
            _pageController.jumpToPage(index);
            setState(() => _currentPage = index);
          },
          items: const <BottomBarItem>[
            BottomBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
              activeColor: Color.fromARGB(255, 117, 111, 104),
            ),
            BottomBarItem(
              icon: Icon(Icons.search),              
              title: Text('Search'),
              activeColor: Color.fromARGB(255, 103, 100, 97),
            ),
            
          ],
        ),
      ),
    );
  }
}