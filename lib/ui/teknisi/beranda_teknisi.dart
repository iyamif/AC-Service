import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:teknisi/ui/dashboard/dashboard.dart';
import 'package:teknisi/ui/teknisi/dashboardteknisi.dart';
import 'package:teknisi/ui/history.dart';
import 'package:teknisi/ui/profile/profile.dart';
import 'package:teknisi/ui/search.dart';
import 'package:teknisi/ui/test.dart';

class BerandaTeknisi extends StatefulWidget {
  const BerandaTeknisi({super.key});

  @override
  State<BerandaTeknisi> createState() => _BerandaTeknisiState();
}

class _BerandaTeknisiState extends State<BerandaTeknisi> {
  late int _selectedPageIndex;
  final int _currentIndex = 0;
  late PageController _pageController;
  late List<Widget> _pages;
  Future<void> setupInteractedMessage() async {
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }

    // Also handle any interaction when the app is in the background via a
    // Stream listener
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    Navigator.pushNamed(
      context,
      '/order',
      //  arguments: ChatArguments(message),
    );
  }

  @override
  void initState() {
    _selectedPageIndex = 0;
    super.initState();
    setupInteractedMessage();
    _pages = [
      const DashboardTeknisi(),
      const History(),
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
          //   Icon(Icons.search, size: 30),
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
