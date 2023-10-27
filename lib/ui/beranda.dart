import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:teknisi/ui/dashboard/dashboard.dart';
import 'package:teknisi/ui/profile/profile.dart';
import 'package:teknisi/ui/test.dart';
import 'package:teknisi/ui/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:teknisi/ui/order.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  late int _selectedPageIndex;
  int _currentIndex = 0;
  late PageController _pageController;

  // final List<Widget> _pages = [
  //   FirstPage(),
  //   ThirdPage(),
  //   SecondPage(),
  //   FourPage(),
  // ];

  late List<Widget> _pages;
  @override
  void initState() {
    _selectedPageIndex = 0;
    super.initState();
    _pages = [
      Dashboard(),
      ThirdPage(),
      SecondPage(),
      Profile(),
    ];
    _pageController = PageController(initialPage: _selectedPageIndex);
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double screenWidth = mediaQueryData.size.width;

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
          Icon(Icons.search, size: 30),
          Icon(Icons.notifications, size: 30),
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

class ThirdPage extends StatelessWidget {
  List<bool> isSelected = [false, false, false];
  List<String> texts = ["Text 1", "Text 2", "Text 3"];
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text('hallooo'),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Mengambil lebar layar perangkat
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Container(
              width: screenWidth,
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 8.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      'Tipe Lokasi',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth * 1,
                    height: screenHeight * 0.13,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      //  color: Color.fromARGB(255, 139, 227, 233),
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromARGB(255, 229, 229, 229),
                          Color.fromARGB(255, 203, 206, 220)
                        ], // Warna gradient
                        begin: Alignment.topLeft, // Posisi awal gradient
                        end: Alignment.bottomRight, // Posisi akhir gradient
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(
                              255, 240, 237, 237), // Warna bayangan
                          offset: Offset(0,
                              1), // Perpindahan bayangan horizontal dan vertikal
                          blurRadius: 3, // Radius blur bayangan
                          spreadRadius: 1, // Sebaran bayangan
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(width: 1.0),
                              shape: BoxShape.circle,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Lokasi Pengerjaan',
                      //   style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(width: 0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 60,
                          child: OutlinedButton(
                            // color: Colors.red,
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide.none),
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(width: 0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 60,
                          child: OutlinedButton(
                            // color: Colors.red,
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide.none),
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Text('Waktu Pengerjaan'),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(width: 0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 60,
                          child: OutlinedButton(
                            // color: Colors.red,
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide.none),
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 255, 255, 255),
                        border: Border.all(width: 0.5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 50,
                          height: 60,
                          child: OutlinedButton(
                            // color: Colors.red,
                            style: ButtonStyle(
                              side: MaterialStateProperty.all(BorderSide.none),
                            ),
                            onPressed: () {},
                            child: Icon(
                              Icons.search,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          width: 200,
                          // decoration: BoxDecoration(border: Border.all()),
                          child: TextField(
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tambahkan Catatan',
                      style: TextStyle(fontSize: 13),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 0.5),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(
                              255, 240, 237, 237), // Warna bayangan
                          offset: Offset(0,
                              1), // Perpindahan bayangan horizontal dan vertikal
                          blurRadius: 3, // Radius blur bayangan
                          spreadRadius: 1, // Sebaran bayangan
                        ),
                      ],
                    ),
                    child: TextField(),
                  ),
                ),
                Container(),
                SizedBox(
                  height: 100,
                ),
              ]),
            ),
          ),
          Positioned(
              bottom: 0,
              height: 50,
              //     left: 160,
              child: Container(
                height: 10,
                width: screenWidth,
                decoration: BoxDecoration(color: Colors.amber),
              ))
        ],
      ),
    );
  }
}
