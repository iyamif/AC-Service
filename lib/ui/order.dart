import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'beranda.dart';

class Order extends StatefulWidget {
  const Order({super.key});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Mengambil lebar layar perangkat
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: screenWidth * 0.13,
                    //  decoration: BoxDecoration(border: Border.all()),
                    child: IconButton(
                      icon: Icon(Icons.keyboard_backspace_outlined),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Beranda(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                      width: screenWidth * 0.6,
                      //  decoration: BoxDecoration(border: Border.all()),
                      child: Center(
                        child: Text('ORDER MENU',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 106, 106, 106),
                            )),
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications_none_rounded,
                      color: Color.fromARGB(255, 0, 0, 0),
                      size: 30,
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 10, left: 8.0),
              //   child: Align(
              //     alignment: Alignment.bottomLeft,
              //     child: Text(
              //       'Tipe Lokasi',
              //       style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Container(
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(255, 255, 255, 255),
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
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8, left: 8, top: 8),
                    child: Column(
                      children: [
                        Container(
                          height: 30,
                          //    color: Colors.amber,
                          width: double.infinity,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Pilih Tipe Lokasi anda ?',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Container(
                          //  color: Colors.black,
                          height: 100,
                          width: double.infinity,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                height: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 80,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 198, 198, 198),
                                            Color.fromARGB(255, 95, 95, 95)
                                          ], // Warna gradient
                                          begin: Alignment
                                              .topLeft, // Posisi awal gradient
                                          end: Alignment
                                              .bottomRight, // Posisi akhir gradient
                                        ),
                                        // border: Border.all(
                                        //     width: 0,
                                        //     color: Color.fromARGB(255, 0, 0, 0)),
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 228, 228, 228),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(255, 216, 216,
                                                216), // Warna bayangan
                                            offset: Offset(0,
                                                1), // Perpindahan bayangan horizontal dan vertikal
                                            blurRadius:
                                                3, // Radius blur bayangan
                                            spreadRadius: 2, // Sebaran bayangan
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/images/houses.png',
                                          // width: 60,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    Text('Rumah')
                                  ],
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 255, 254, 252),
                                            Color.fromARGB(255, 176, 176, 200)
                                          ], // Warna gradient
                                          begin: Alignment
                                              .topLeft, // Posisi awal gradient
                                          end: Alignment
                                              .bottomRight, // Posisi akhir gradient
                                        ),
                                        // border: Border.all(
                                        //     width: 0,
                                        //     color: Color.fromARGB(255, 0, 0, 0)),
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 228, 228, 228),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromARGB(255, 216, 216,
                                                216), // Warna bayangan
                                            offset: Offset(0,
                                                1), // Perpindahan bayangan horizontal dan vertikal
                                            blurRadius:
                                                1, // Radius blur bayangan
                                            spreadRadius: 1, // Sebaran bayangan
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          'assets/images/apart.png',
                                          width: 60,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    Text('Apartement')
                                  ],
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 80,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 1, 255, 247),
                                            Color.fromARGB(255, 2, 116, 133)
                                          ], // Warna gradient
                                          begin: Alignment
                                              .topLeft, // Posisi awal gradient
                                          end: Alignment
                                              .bottomRight, // Posisi akhir gradient
                                        ),
                                        // border: Border.all(
                                        //     width: 0,
                                        //     color: Color.fromARGB(255, 0, 0, 0)),
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 228, 228, 228),
                                        boxShadow: const [
                                          BoxShadow(
                                            color: Color.fromARGB(255, 216, 216,
                                                216), // Warna bayangan
                                            offset: Offset(0,
                                                1), // Perpindahan bayangan horizontal dan vertikal
                                            blurRadius:
                                                3, // Radius blur bayangan
                                            spreadRadius: 2, // Sebaran bayangan
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Image.asset(
                                          'assets/images/shop.png',
                                          // width: 60,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    Text('Ruko')
                                  ],
                                ),
                              ),
                              Container(
                                height: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 60,
                                      height: 80,
                                      decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Color.fromARGB(255, 196, 255, 1),
                                            Color.fromARGB(255, 37, 99, 1)
                                          ], // Warna gradient
                                          begin: Alignment
                                              .topLeft, // Posisi awal gradient
                                          end: Alignment
                                              .bottomRight, // Posisi akhir gradient
                                        ),
                                        // border: Border.all(
                                        //     width: 0,
                                        //     color: Color.fromARGB(255, 0, 0, 0)),
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 228, 228, 228),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(255, 216, 216,
                                                216), // Warna bayangan
                                            offset: Offset(0,
                                                1), // Perpindahan bayangan horizontal dan vertikal
                                            blurRadius:
                                                3, // Radius blur bayangan
                                            spreadRadius: 2, // Sebaran bayangan
                                          ),
                                        ],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Image.asset(
                                          'assets/images/rumah.png',
                                          // width: 60,
                                          height: 50,
                                        ),
                                      ),
                                    ),
                                    Text('Kost')
                                  ],
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
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Lokasi Pengerjaan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth * 0.95,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(width: 0.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Image.asset(
                            'assets/images/send.png',
                            width: screenWidth * 0.6,
                            height: 50,
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        // decoration: BoxDecoration(border: Border.all()),
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Lokasi saat ini',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
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
                  width: screenWidth * 0.95,
                  height: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(width: 0.5)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                          child: Image.asset(
                            'assets/images/rumah.png',
                            width: screenWidth * 0.6,
                            height: 50,
                          ),
                        ),
                      ),
                      Container(
                        width: 300,
                        // decoration: BoxDecoration(border: Border.all()),
                        child: TextField(
                          textAlign: TextAlign.left,
                          decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: 'Detail Lokasi',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Waktu Pengerjaan',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: screenWidth * 0.7,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(width: 0.5)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 60,
                            //    color: Colors.amber,
                            child: OutlinedButton(
                              style: ButtonStyle(
                                side:
                                    MaterialStateProperty.all(BorderSide.none),
                              ),
                              onPressed: () {},
                              child: Image.asset(
                                'assets/images/calendar.png',
                                width: screenWidth * 0.6,
                                height: 50,
                              ),
                            ),
                          ),
                          Container(
                            width: 220,
                            //  color: Colors.amber,
                            // decoration: BoxDecoration(border: Border.all()),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: TextField(
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide.none),
                                    hintText: 'Senin, 28 Oktober 2023',
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    hintStyle: TextStyle(
                                        color: Colors.black, fontSize: 15)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Container(
                      width: screenWidth * 0.2,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: Color.fromARGB(255, 255, 255, 255),
                          border: Border.all(width: 0.5)),
                      child: TextField(
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            hintText: '19:00',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            hintStyle:
                                TextStyle(color: Colors.black, fontSize: 15)),
                      ),
                    )
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     width: screenWidth * 0.95,
              //     height: 50,
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(14),
              //         color: Color.fromARGB(255, 255, 255, 255),
              //         border: Border.all(width: 0.5)),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //       children: [
              //         Container(
              //           alignment: Alignment.center,
              //           width: 50,
              //           height: 60,
              //           decoration: BoxDecoration(
              //               //border: Border.all(width: 0.5),
              //               ),
              //           child: OutlinedButton(
              //             // color: Colors.red,
              //             style: ButtonStyle(
              //               side: MaterialStateProperty.all(BorderSide.none),
              //             ),
              //             onPressed: () {},
              //             child: Image.asset(
              //               'assets/images/clock.png',
              //               width: screenWidth * 0.6,
              //               //    height: 50,
              //             ),
              //           ),
              //         ),
              //         Container(
              //           width: 300,
              //           //    decoration: BoxDecoration(border: Border.all()),
              //           child: TextField(
              //             decoration: InputDecoration(
              //                 border: OutlineInputBorder(
              //                     borderSide: BorderSide.none),
              //                 hintText: '19:00 WIB'),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Tambahkan Catatan',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth * 0.95,
                  height: 100,
                  padding: EdgeInsets.all(8.0),
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    child: TextFormField(
                      textAlign: TextAlign.left,
                      maxLines: null,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                          border:
                              OutlineInputBorder(borderSide: BorderSide.none),
                          hintText: 'Masukan deskripsi kerusakan disini. . . .',
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 10),
                          hintStyle: TextStyle(
                              color: const Color.fromARGB(255, 193, 193, 193),
                              fontSize: 15)),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: screenHeight * 0.1,
        width: screenWidth,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(6)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 60,
                  width: 100,
                  //  color: Colors.amber,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 2, bottom: 3),
                        child: Container(
                          width: double.infinity,
                          child: Text(
                            'Kategori :',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 1),
                        child: Text('Perawatan AC',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15)),
                      )
                    ],
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color.fromARGB(255, 107, 107, 107)),
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      'order now',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
