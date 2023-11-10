import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:teknisi/ui/dashboard/dashboard.dart';
import 'package:teknisi/ui/history.dart';
import 'package:teknisi/ui/profile/profile.dart';
import 'package:teknisi/ui/search.dart';
import 'package:teknisi/ui/test.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  late int _selectedPageIndex;
  final int _currentIndex = 0;
  late PageController _pageController;
  late List<Widget> _pages;

  @override
  void initState() {
    _selectedPageIndex = 0;
    super.initState();
    _pages = [
      const Dashboard(),
      const History(),
      const Search(),
      Profile(),
    ];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50.0,
        items: const <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.notifications, size: 30),
          Icon(Icons.search, size: 30),
          Icon(
            Icons.account_circle,
            size: 30,
          ),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            _selectedPageIndex = index;
            _pageController.jumpToPage(index);
          });
        },
      ),
    );
  }
}
