import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
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
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FirstPage(),
    ThirdPage(),
    SecondPage(),
    FourPage(),
  ];

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    double screenWidth = mediaQueryData.size.width;

    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50.0,
        items: <Widget>[
          const Icon(Icons.home, size: 30),
          const Icon(Icons.search, size: 30),
          const Icon(Icons.notifications, size: 30),
          const Icon(
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
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    Future<void> _order(nama, kode) async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Order(nama: nama, kode: kode),
        ),
      );
    }

    Future<void> _test() async {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => tesTing(),
        ),
      );
    }

    // Mengambil lebar layar perangkat
    double screenWidth = mediaQueryData.size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 10, right: 10),
            child: Container(
              // color: Colors.white,
              width: screenWidth * 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth * 0.13,
                        //  decoration: BoxDecoration(border: Border.all()),
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      Container(
                          width: screenWidth * 0.6,
                          //  decoration: BoxDecoration(border: Border.all()),
                          child: Text(
                            'HI, Iyamif !',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.notifications_none_rounded,
                          color: Color.fromARGB(255, 9, 31, 110),
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(8),
                  //   child: Container(
                  //     width: screenWidth * 0.9,
                  //     height: 50,
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(14),
                  //       color: Color.fromARGB(255, 255, 255, 255),
                  //     ),
                  //     child: Padding(
                  //       padding: const EdgeInsets.only(
                  //           top: 8, bottom: 8, left: 4, right: 4),
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           Container(
                  //             width: 200,
                  //             // decoration: BoxDecoration(border: Border.all()),
                  //             child: TextField(
                  //               decoration: InputDecoration(
                  //                   border: OutlineInputBorder(
                  //                       borderSide: BorderSide.none)),
                  //             ),
                  //           ),
                  //           Container(
                  //               alignment: Alignment.center,
                  //               width: 50,
                  //               height: 60,
                  //               child: OutlinedButton(
                  //                 // color: Colors.red,
                  //                 style: ButtonStyle(
                  //                   side: MaterialStateProperty.all(
                  //                       BorderSide.none),
                  //                 ),
                  //                 onPressed: () {},
                  //                 child: Icon(
                  //                   Icons.search,
                  //                   color: Colors.black,
                  //                 ),
                  //               ))
                  //         ],
                  //       ),
                  //     ),
                  //     //   color: const Color.fromARGB(255, 220, 220, 220),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 20,
                  // ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      width: screenWidth * 0.9,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Color.fromARGB(255, 255, 255, 255),
                        //   border: Border.all(width: 1.0),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: ImageSlideshow(
                          //   width: double.infinity,

                          /// Height of the [ImageSlideshow].
                          height: 200,

                          /// The page to show when first creating the [ImageSlideshow].
                          initialPage: 0,

                          /// The color to paint the indicator.
                          indicatorColor: Colors.blue,

                          /// The color to paint behind th indicator.
                          indicatorBackgroundColor: Colors.grey,
                          children: [
                            Image.network(
                                'https://media.pricebook.co.id/article/5e5e294ab92c2e49128b456b/5e5e294ab92c2e49128b456b_1638247494.jpg',
                                fit: BoxFit.cover),
                            Image.network(
                                'https://media.pricebook.co.id/article/5e5e294ab92c2e49128b456b/5e5e294ab92c2e49128b456b_1638247494.jpg',
                                fit: BoxFit.cover),
                            Image.network(
                                'https://media.pricebook.co.id/article/5e5e294ab92c2e49128b456b/5e5e294ab92c2e49128b456b_1638247494.jpg',
                                fit: BoxFit.cover),
                          ],
                          onPageChanged: (value) {
                            print('Page changed: $value');
                          },

                          /// Auto scroll interval.
                          /// Do not auto scroll with null or 0.
                          autoPlayInterval: 30000,

                          /// Loops back to first slide.
                          isLoop: false,
                        ),
                      ),
                      //   color: const Color.fromARGB(255, 220, 220, 220),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Status Order',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Card(
                    //    color: Color.fromARGB(255, 223, 222, 222),
                    elevation: 4,
                    color: Color.fromARGB(255, 23, 0, 136),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 2, 46, 122),
                        //  width: 2.0,
                      ), // Atur warna dan lebar garis luar (outline)
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        width: 380,
                        height: 100,
                        padding: const EdgeInsets.fromLTRB(3, 0, 1, 0),
                        // decoration: const BoxDecoration(
                        //   color: Colors.white,
                        // ),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 150,
                                    padding: const EdgeInsets.all(8),
                                    // decoration: BoxDecoration(
                                    //   //  border: Border.all(color: Colors.black, width: 0.5),
                                    //   borderRadius: BorderRadius.circular(5.0),
                                    //   color: Color.fromARGB(255, 250, 249, 249),
                                    // ),
                                    child: Text(
                                      'ADI JAYA SERVICE',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255)),
                                    ),
                                  ),
                                  Icon(
                                    Icons.verified,
                                    size: 20,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  )
                                ],
                              ),
                            ),
                            Divider(color: Color.fromARGB(255, 168, 168, 168)),
                            const SizedBox(
                              height: 10,
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.all(5),
                            //       decoration: BoxDecoration(
                            //         //  border: Border.all(color: Colors.black),
                            //         borderRadius: BorderRadius.circular(5.0),
                            //       ),
                            //       child: const Center(
                            //         child: Text(
                            //           'Tanggal Order :',
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       padding: const EdgeInsets.all(5),
                            //       decoration: BoxDecoration(
                            //         // border:
                            //         //     Border.all(color: Colors.black, width: 0.5),
                            //         borderRadius: BorderRadius.circular(3.0),
                            //       ),
                            //       child: const Center(
                            //         child: Text(
                            //           '24 Desember 2023',
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.all(8),
                            //       decoration: BoxDecoration(
                            //         //  border: Border.all(color: Colors.black, width: 1.0),
                            //         borderRadius: BorderRadius.circular(3.0),
                            //       ),
                            //       child: const Center(
                            //         child: Text(
                            //           'Jam Order :',
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       padding: const EdgeInsets.all(8),
                            //       decoration: BoxDecoration(
                            //         //  border: Border.all(color: Colors.black, width: 1.0),
                            //         borderRadius: BorderRadius.circular(3.0),
                            //       ),
                            //       child: const Center(
                            //         child: Text(
                            //           '12:00 WIB',
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Container(
                            //       padding: const EdgeInsets.all(8),
                            //       decoration: BoxDecoration(
                            //         //  border: Border.all(color: Colors.black, width: 1.0),
                            //         borderRadius: BorderRadius.circular(3.0),
                            //       ),
                            //       child: const Center(
                            //         child: Text(
                            //           'Tipe Service :',
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //     ),
                            //     Container(
                            //       padding: const EdgeInsets.all(8),
                            //       decoration: BoxDecoration(
                            //         //  border: Border.all(color: Colors.black, width: 1.0),
                            //         borderRadius: BorderRadius.circular(3.0),
                            //       ),
                            //       child: const Center(
                            //         child: Text(
                            //           'Perawatan AC',
                            //           style: TextStyle(
                            //               fontSize: 15,
                            //               fontWeight: FontWeight.bold),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            // Center(
                            //   child: Container(
                            //     padding: const EdgeInsets.all(8),
                            //     decoration: BoxDecoration(
                            //       // border: Border.all(
                            //       //     color: const Color.fromARGB(131, 131, 131, 131),
                            //       //     width: 0.5),
                            //       borderRadius: BorderRadius.circular(3.0),
                            //       color: Color.fromARGB(255, 68, 16, 152),
                            //     ),
                            //     child: const Center(
                            //       child: Row(
                            //         children: [
                            //           Icon(
                            //             Icons.map_sharp,
                            //             color: Color.fromARGB(255, 255, 255, 255),
                            //             size: 15.0,
                            //           ),
                            //           SizedBox(
                            //             width: 30.0,
                            //           ),
                            //           Center(
                            //             child: Text(
                            //               'Jl. Cikoko Timur no.2 Jakarta selatan',
                            //               style: TextStyle(
                            //                   fontSize: 15, color: Colors.white),
                            //             ),
                            //           ),
                            //         ],
                            //       ),
                            //     ),
                            //   ),
                            // ),
                            // Divider(
                            //   color: const Color.fromARGB(255, 142, 142, 142),
                            //   thickness: 0.5,
                            // ),
                            // SizedBox(
                            //   height: 6.0,
                            // ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //   children: [
                            //     Text('Status order'),
                            //     ElevatedButton(
                            //       onPressed: () {
                            //         // Navigator.pop(context); // Tutup bottom sheet
                            //       },
                            //       style: ButtonStyle(
                            //           backgroundColor:
                            //               MaterialStateProperty.all(
                            //                   Color.fromARGB(
                            //                       255, 68, 16, 152))),
                            //       child: Text(
                            //         'Konfirmasi',
                            //         style: TextStyle(
                            //             fontSize: 15,
                            //             fontWeight: FontWeight.bold),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Mau service apa ?',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Container(
                      width: screenWidth * 1,
                      //  decoration: BoxDecoration(border: Border.all()),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.5),
                                  child: Container(
                                    width: screenWidth * 0.44,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 240, 237,
                                              237), // Warna bayangan
                                          offset: Offset(0,
                                              1), // Perpindahan bayangan horizontal dan vertikal
                                          blurRadius: 3, // Radius blur bayangan
                                          spreadRadius: 1, // Sebaran bayangan
                                        ),
                                      ],
                                      //   border: Border.all(width: 0.5),
                                    ),
                                    child: CupertinoButton(
                                      onPressed: () {
                                        _order('PERAWATAN AC', 'R01');
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              _order('PERAWATAN AC', 'R01');
                                            },
                                            icon: Image.asset(
                                              'assets/images/perawatan.png',
                                              width: screenWidth * 0.6,
                                              height: 50,
                                            ),
                                          ),
                                          Text(
                                            'Perawatan AC',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 0.5),
                                  child: Container(
                                    width: screenWidth * 0.44,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 240, 237,
                                              237), // Warna bayangan
                                          offset: Offset(0,
                                              1), // Perpindahan bayangan horizontal dan vertikal
                                          blurRadius: 3, // Radius blur bayangan
                                          spreadRadius: 1, // Sebaran bayangan
                                        ),
                                      ],
                                      //   border: Border.all(width: 0.5),
                                    ),
                                    child: CupertinoButton(
                                      onPressed: () {
                                        _order('PERAWATAN DAN TAMBAH FREON',
                                            'R02');
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              _order(
                                                  'PERAWATAN DAN TAMBAH FREON',
                                                  'R02');
                                            },
                                            icon: Image.asset(
                                              'assets/images/tambah_freon.png',
                                              width: screenWidth * 0.6,
                                              height: 50,
                                            ),
                                          ),
                                          Text(
                                            'Perawatan',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            'Dan Tambah Freon',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.5),
                                  child: Container(
                                    width: screenWidth * 0.44,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 240, 237,
                                              237), // Warna bayangan
                                          offset: Offset(0,
                                              1), // Perpindahan bayangan horizontal dan vertikal
                                          blurRadius: 3, // Radius blur bayangan
                                          spreadRadius: 1, // Sebaran bayangan
                                        ),
                                      ],
                                      //   border: Border.all(width: 0.5),
                                    ),
                                    child: CupertinoButton(
                                      pressedOpacity: 0.2,
                                      onPressed: () {
                                        _order('PEMASANGAN AC', 'R03');
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              _order('PEMASANGAN AC', 'R03');
                                            },
                                            icon: Image.asset(
                                              'assets/images/service.png',
                                              width: screenWidth * 0.6,
                                              height: 50,
                                            ),
                                          ),
                                          Text(
                                            'Pemasangan AC',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 0.5),
                                  child: Container(
                                    width: screenWidth * 0.44,
                                    height: 120,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      boxShadow: const [
                                        BoxShadow(
                                          color: Color.fromARGB(255, 240, 237,
                                              237), // Warna bayangan
                                          offset: Offset(0,
                                              1), // Perpindahan bayangan horizontal dan vertikal
                                          blurRadius: 3, // Radius blur bayangan
                                          spreadRadius: 1, // Sebaran bayangan
                                        ),
                                      ],
                                      //   border: Border.all(width: 0.5),
                                    ),
                                    child: CupertinoButton(
                                      pressedOpacity: 0.2,
                                      onPressed: () {
                                        _order('BONGKAR DAN PASANG AC', 'R04');
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              _order('BONGKAR DAN PASANG AC',
                                                  'R04');
                                            },
                                            icon: Image.asset(
                                              'assets/images/house.png',
                                              width: screenWidth * 0.6,
                                              height: 50,
                                            ),
                                          ),
                                          Text(
                                            'Bongkar',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                          Text(
                                            'Pasang AC',
                                            style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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

class FourPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Mengambil lebar layar perangkat
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Container(
          width: screenWidth,
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 8.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Profil',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: screenWidth * 1,
                height: screenHeight * 0.2,
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
                      color:
                          Color.fromARGB(255, 240, 237, 237), // Warna bayangan
                      offset: Offset(
                          0, 1), // Perpindahan bayangan horizontal dan vertikal
                      blurRadius: 3, // Radius blur bayangan
                      spreadRadius: 1, // Sebaran bayangan
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                      child: Container(
                        width: screenWidth * 0.25,
                        //   decoration: BoxDecoration(border: Border.all()),
                        child: Icon(
                          Icons.person_rounded,
                          size: screenWidth * 0.3,
                          color: Color.fromARGB(255, 0, 0, 0),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        // alignment: Alignment.centerLeft,
                        width: screenWidth * 0.5,
                        // decoration: BoxDecoration(border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 25),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'ILHAM FIRMANSYAH',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0)),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '082118092105',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: const Color.fromARGB(
                                              255, 0, 0, 0)),
                                    )),
                              )
                            ],
                          ),
                        ),
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
                  'Riwayat Service',
                  //   style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: screenWidth,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 93, 77, 167),
                  boxShadow: const [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 240, 237, 237), // Warna bayangan
                      offset: Offset(
                          0, 1), // Perpindahan bayangan horizontal dan vertikal
                      blurRadius: 3, // Radius blur bayangan
                      spreadRadius: 1, // Sebaran bayangan
                    ),
                  ],
                ),
                child: Center(
                    child: Text(
                  'TEXT HERE',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Referensi',
                  style: TextStyle(fontSize: 13),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 380,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color:
                          Color.fromARGB(255, 240, 237, 237), // Warna bayangan
                      offset: Offset(
                          0, 1), // Perpindahan bayangan horizontal dan vertikal
                      blurRadius: 3, // Radius blur bayangan
                      spreadRadius: 1, // Sebaran bayangan
                    ),
                  ],
                ),
              ),
            ),
            Container()
          ]),
        ),
      ),
    );
  }
}
