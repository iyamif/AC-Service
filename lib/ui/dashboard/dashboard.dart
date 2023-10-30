import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:teknisi/ui/history.dart';
import 'package:teknisi/ui/order.dart';
import 'package:teknisi/ui/test.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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

    // Mengambil lebar layar perangkat
    double screenWidth = mediaQueryData.size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            // color: Colors.white,
            width: screenWidth,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: screenWidth * 0.13,
                      //  decoration: BoxDecoration(border: Border.all()),
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                    ),
                    SizedBox(
                        width: screenWidth * 0.6,
                        //  decoration: BoxDecoration(border: Border.all()),
                        child: const Text(
                          'HI, Iyamif !',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const History(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.notifications_none_rounded,
                        color: Color.fromARGB(255, 9, 31, 110),
                        size: 30,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: const Color.fromARGB(255, 255, 255, 255),
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
                        height: 200,
                        initialPage: 0,
                        indicatorColor: Colors.blue,
                        indicatorBackgroundColor: Colors.grey,
                        onPageChanged: (value) {
                          // print('Page changed: $value');
                        },
                        autoPlayInterval: 30000,
                        isLoop: false,
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
                      ),
                    ),
                    //   color: const Color.fromARGB(255, 220, 220, 220),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    width: screenWidth * 0.9,
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      'Status Order',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 8, left: 8, right: 8, bottom: 4),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 255, 255),
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
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8),
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: const Text(
                      'Mau service apa ?',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: screenWidth * 0.45,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: CupertinoButton(
                          onPressed: () {
                            _order('PERAWATAN AC', 'R01');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _order('PERAWATAN AC', 'R01');
                                },
                                icon: Image.asset(
                                  'assets/images/perawatan.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                              const Text(
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
                      Container(
                        width: screenWidth * 0.45,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: CupertinoButton(
                          onPressed: () {
                            _order('PERAWATAN DAN TAMBAH FREON', 'R02');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _order('PERAWATAN DAN TAMBAH FREON', 'R02');
                                },
                                icon: Image.asset(
                                  'assets/images/tambah_freon.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                              const Text(
                                'Perawatan',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              const Text(
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 4, bottom: 4, left: 8, right: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        width: screenWidth * 0.45,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: CupertinoButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _order('PEMASANGAN AC', 'R03');
                                },
                                icon: Image.asset(
                                  'assets/images/service.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                              const Text(
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
                      Container(
                        width: screenWidth * 0.45,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
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
                        child: CupertinoButton(
                          onPressed: () {
                            _order('BONGKAR DAN PASANG AC', 'R04');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _order('BONGKAR DAN PASANG AC', 'R04');
                                },
                                icon: Image.asset(
                                  'assets/images/house.png',
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                              const Text(
                                'Bongkar',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              const Text(
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}