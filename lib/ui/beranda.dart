import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:teknisi/ui/utils.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Beranda extends StatefulWidget {
  const Beranda({super.key});

  @override
  State<Beranda> createState() => _BerandaState();
}

class _BerandaState extends State<Beranda> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    FirstPage(),
    SecondPage(),
    ThirdPage(),
    FourPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // Membuat objek MediaQuery
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Mengambil lebar layar perangkat
    double screenWidth = mediaQueryData.size.width;

    return Scaffold(
      // appBar: AppBar(
      //   title: Center(
      //     child: Text(
      //       'Teknisi AC',
      //       style: SafeGoogleFont(
      //         'Inter',
      //         fontSize: 20 * ffem,
      //         fontWeight: FontWeight.w700,
      //         height: 1.3 * ffem / fem,
      //         color: const Color.fromARGB(255, 5, 5, 5),
      //       ),
      //     ),
      //   ),
      //   actions: [
      //     IconButton(
      //       icon: const Icon(Icons.notifications,
      //           color: Color.fromARGB(255, 9, 31, 110)),
      //       color: const Color.fromARGB(255, 0, 0, 0), // Ikon lonceng
      //       onPressed: () {
      //         // Aksi yang ingin dijalankan saat tombol lonceng ditekan
      //       },
      //     ),
      //   ],
      //   backgroundColor: const Color.fromARGB(255, 237, 237, 237),
      //   iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
      // ),
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        index: _currentIndex,
        height: 50.0,
        items: <Widget>[
          const Icon(Icons.home, size: 30),
          const Icon(Icons.search, size: 30),
          const Icon(Icons.settings, size: 30),
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
    return Scaffold(
      body: SingleChildScrollView(
        //  width: double.infinity,
        child: Column(
          children: [
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Hello, Iyamif!',
            //     style: TextStyle(fontSize: 30),
            //   ),
            // ),
            Container(
              decoration: const BoxDecoration(),
              child: // Carousel
                  CarouselSlider(
                options: CarouselOptions(
                  height: 200.0, // Atur tinggi carousel sesuai kebutuhan
                ),
                items: [
                  Image.network(
                      'https://media.pricebook.co.id/article/5e5e294ab92c2e49128b456b/5e5e294ab92c2e49128b456b_1638247494.jpg',
                      fit: BoxFit.cover),
                  Image.network(
                      'https://images.unsplash.com/photo-1574217013471-c32c6846cef7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zm90b3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                      fit: BoxFit.cover),
                  Image.network(
                      'https://3.bp.blogspot.com/-HlKo1DSjY-U/V5_HowL6W3I/AAAAAAAAGfE/UOTItuyovjoMlvElSgV4mOSdSabm7N71gCLcB/s1600/service%2Bac%2Bbeji%2Bdepok.jpg',
                      fit: BoxFit.cover),
                ],
              ),
            ),
            const SizedBox(height: 9.0),
            Container(
              width: 390,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //   color: Color.fromARGB(255, 237, 240, 242),
                    //   padding: EdgeInsets.all(5.0),
                    width: 160,
                    child: const Text(
                      'Bidang Jasa',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Container(
                  //   //   color: Color.fromARGB(255, 237, 240, 242),
                  //   //   padding: EdgeInsets.all(5.0),
                  //   width: 160,
                  //   child: Text(
                  //     'urutkan',
                  //     textAlign: TextAlign.right,
                  //   ),
                  // ),
                ],
              ),
            ),
            const SizedBox(height: 9.0),
            Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                    color: Color.fromARGB(255, 237, 240, 242),
                    width: 1.0), // Atur warna dan lebar garis luar (outline)
                borderRadius: BorderRadius.circular(10.0), // Atur radius sudut
              ),
              child: Container(
                width: 380,
                height: 90,
                child: Align(
                  //alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.favorite,
                                color: Color.fromARGB(255, 9, 31, 110)),
                            onPressed: () {
                              // Tindakan yang akan diambil ketika tombol ditekan.
                            },
                          ),
                          const Text(
                            'Perawat AC',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.share,
                                color: Color.fromARGB(255, 9, 31, 110)),
                            onPressed: () {
                              // Tindakan yang akan diambil ketika tombol ditekan.
                            },
                          ),
                          const Text(
                            'Perawatan',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'dan isi freon',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.access_alarms_outlined,
                                color: Color.fromARGB(255, 9, 31, 110)),
                            onPressed: () {
                              // Tindakan yang akan diambil ketika tombol ditekan.
                            },
                          ),
                          const Text(
                            'Pemasangan',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'AC',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.airplay_outlined,
                                color: Color.fromARGB(255, 9, 31, 110)),
                            onPressed: () {
                              // Tindakan yang akan diambil ketika tombol ditekan.
                            },
                          ),
                          const Text(
                            'Bongkar',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Pasang AC',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 9.0),
            SizedBox(
              width: 370,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    //   color: Color.fromARGB(255, 237, 240, 242),
                    //   padding: EdgeInsets.all(5.0),
                    width: 160,
                    child: const Text(
                      'Status order',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    //   color: Color.fromARGB(255, 237, 240, 242),
                    //   padding: EdgeInsets.all(5.0),
                    width: 140,
                    child: Text(
                      'urutkan',
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            Card(
              //    color: Color.fromARGB(255, 223, 222, 222),
              elevation: 4,
              shape: RoundedRectangleBorder(
                side: const BorderSide(
                  color: Color.fromARGB(255, 255, 255, 255),
                  //  width: 2.0,
                ), // Atur warna dan lebar garis luar (outline)
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                  width: 380,
                  height: 245,
                  padding: const EdgeInsets.fromLTRB(3, 0, 1, 0),
                  // decoration: const BoxDecoration(
                  //   color: Colors.white,
                  // ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    color: Color.fromARGB(255, 85, 85, 85)),
                              ),
                            ),
                            Icon(
                              Icons.verified,
                              size: 20,
                              color: Color.fromARGB(255, 68, 16, 152),
                            )
                          ],
                        ),
                      ),
                      Divider(color: Color.fromARGB(255, 68, 16, 152)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.black),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Tanggal Order :',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              // border:
                              //     Border.all(color: Colors.black, width: 0.5),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: const Center(
                              child: Text(
                                '24 Desember 2023',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Jam Order :',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: const Center(
                              child: Text(
                                '12:00 WIB',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Tipe Service :',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              //  border: Border.all(color: Colors.black, width: 1.0),
                              borderRadius: BorderRadius.circular(3.0),
                            ),
                            child: const Center(
                              child: Text(
                                'Perawatan AC',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            // border: Border.all(
                            //     color: const Color.fromARGB(131, 131, 131, 131),
                            //     width: 0.5),
                            borderRadius: BorderRadius.circular(3.0),
                            color: Color.fromARGB(255, 68, 16, 152),
                          ),
                          child: const Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.map_sharp,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  size: 15.0,
                                ),
                                SizedBox(
                                  width: 30.0,
                                ),
                                Center(
                                  child: Text(
                                    'Jl. Cikoko Timur no.2 Jakarta selatan',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // Divider(
                      //   color: const Color.fromARGB(255, 142, 142, 142),
                      //   thickness: 0.5,
                      // ),
                      SizedBox(
                        height: 6.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Status order'),
                          ElevatedButton(
                            onPressed: () {
                              // Navigator.pop(context); // Tutup bottom sheet
                            },
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    Color.fromARGB(255, 68, 16, 152))),
                            child: Text(
                              'Konfirmasi',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(3, 0, 1, 0),
                  width: 195,
                  height: 200,
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 237, 240, 242),
                            width:
                                1.0), // Atur warna dan lebar garis luar (outline)
                        borderRadius:
                            BorderRadius.circular(10.0), // Atur radius sudut
                      ),
                      child: Center(
                        child: Container(
                          child: const Text('foto'),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(2, 0, 1, 0),
                  width: 195,
                  height: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 237, 240, 242),
                          width:
                              1.0), // Atur warna dan lebar garis luar (outline)
                      borderRadius:
                          BorderRadius.circular(10.0), // Atur radius sudut
                    ),
                    child: Center(
                      child: Container(
                        child: const Text('foto'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(3, 0, 1, 0),
                  width: 195,
                  height: 200,
                  child: Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            color: Color.fromARGB(255, 237, 240, 242),
                            width:
                                1.0), // Atur warna dan lebar garis luar (outline)
                        borderRadius:
                            BorderRadius.circular(10.0), // Atur radius sudut
                      ),
                      child: Center(
                        child: Container(
                          child: const Text('foto'),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(2, 0, 1, 0),
                  width: 195,
                  height: 200,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(
                          color: Color.fromARGB(255, 237, 240, 242),
                          width:
                              1.0), // Atur warna dan lebar garis luar (outline)
                      borderRadius:
                          BorderRadius.circular(10.0), // Atur radius sudut
                    ),
                    child: Center(
                      child: Container(
                        child: const Text('foto'),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Halaman 2'),
    );
  }
}

class ThirdPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Mengambil lebar layar perangkat
    double screenWidth = mediaQueryData.size.width;
    return SingleChildScrollView(
      child: Container(
        width: screenWidth,
        //  color: Colors.white,
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
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 8, bottom: 8, left: 4, right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 200,
                            // decoration: BoxDecoration(border: Border.all()),
                            child: TextField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          Container(
                              alignment: Alignment.center,
                              width: 50,
                              height: 60,
                              child: OutlinedButton(
                                // color: Colors.red,
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(
                                      BorderSide.none),
                                ),
                                onPressed: () {},
                                child: Icon(
                                  Icons.search,
                                  color: Colors.black,
                                ),
                              ))
                        ],
                      ),
                    ),
                    //   color: const Color.fromARGB(255, 220, 220, 220),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: screenWidth * 0.9,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      color: Color.fromARGB(255, 53, 4, 108),
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
                    child: Center(
                        child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400,
                        aspectRatio:
                            1.0, // Menyamakan rasio aspek item dengan lebar Container
                        viewportFraction: 1.0,
                        initialPage: 0,
                        enableInfiniteScroll: true,
                        autoPlayInterval: Duration(seconds: 3),
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,

                        // Atur tinggi carousel sesuai kebutuhan
                      ),
                      items: [
                        Image.network(
                            'https://media.pricebook.co.id/article/5e5e294ab92c2e49128b456b/5e5e294ab92c2e49128b456b_1638247494.jpg',
                            fit: BoxFit.cover),
                        Image.network(
                            'https://images.unsplash.com/photo-1574217013471-c32c6846cef7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Zm90b3xlbnwwfHwwfHx8MA%3D%3D&w=1000&q=80',
                            fit: BoxFit.cover),
                        Image.network(
                            'https://3.bp.blogspot.com/-HlKo1DSjY-U/V5_HowL6W3I/AAAAAAAAGfE/UOTItuyovjoMlvElSgV4mOSdSabm7N71gCLcB/s1600/service%2Bac%2Bbeji%2Bdepok.jpg',
                            fit: BoxFit.cover),
                      ],
                    )),
                    //   color: const Color.fromARGB(255, 220, 220, 220),
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
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
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
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
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
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
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
                                    onPressed: () {},
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        IconButton(
                                          onPressed: () {},
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
