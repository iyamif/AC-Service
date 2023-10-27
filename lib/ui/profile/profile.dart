import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknisi/main.dart';

class Profile extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
            const Padding(
              padding: EdgeInsets.only(top: 10, left: 8.0),
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
                                  child: const Text(
                                    'ILHAM FIRMANSYAH',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: const Text(
                                      '082118092105',
                                      style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          color: Color.fromARGB(255, 0, 0, 0)),
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
                  color: const Color.fromARGB(255, 93, 77, 167),
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
                child: const Center(
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
                  'Preferensi',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: screenWidth,
                  //     height: 100,
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
                  child: Column(
                    children: [
                      CupertinoButton(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              color: Colors.transparent,
                              child: const Icon(
                                Icons.language_outlined,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            Container(
                              width: 250,
                              color: Colors.transparent,
                              child: const Text(
                                'Bahasa',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 15, left: 15),
                        child: Divider(
                          height: 10,
                          color: Colors.grey,
                        ),
                      ),
                      CupertinoButton(
                        padding: const EdgeInsets.all(10),
                        color: const Color.fromARGB(255, 255, 255, 255),
                        onPressed: () {
                          popupLogout();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              color: Colors.transparent,
                              child: const Icon(
                                Icons.logout,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                            Container(
                              width: 250,
                              color: Colors.transparent,
                              child: const Text(
                                'Keluar',
                                style: TextStyle(
                                  color: Colors.lightBlueAccent,
                                ),
                              ),
                            ),
                            // Icon(
                            //   Icons.arrow_forward_ios,
                            //   size: 20,
                            //   color: Colors.black,
                            // ),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            Container()
          ]),
        ),
      ),
    );
  }

  void logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    // ignore: use_build_context_synchronously
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => const MyHomePage(
                title: 'TEKNISI AC',
              )),
      (route) => false,
    );
    // }
  }

  Future<bool> popupLogout() async {
    return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text('Anda yakin?'),
                  content: const Text('Anda ingin keluar ?'),
                  actions: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('Tidak')),
                    TextButton(
                        onPressed: () => logout(), child: const Text('Ya')),
                  ],
                ))) ??
        false;
  }
}
