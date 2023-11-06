import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teknisi/ui/beranda.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  int notificationCount = 3;
  List<List<String>> listsData = [
    ['PT SERVICE JAKARTA', 'Rudi William', 'AC/Kulkas/TV', '10 Tahun', '0'],
    ['PT AC JAKARTA', 'HERU AMAR', 'AC', '10 Tahun', '2'],
    ['PT AC SENTOSA', 'Rudi William', 'AC/Kulkas/TV', '10 Tahun', '5'],
    ['TEKNISI JAKARTA', 'Rudi William', 'AC/Kulkas/TV', '10 Tahun', '6'],
    ['PT SERVICE JAKARTA', 'Rudi William', 'AC/Kulkas/TV', '10 Tahun', '3'],
  ];
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeigth = mediaQueryData.size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: screenWidth * 0.13,
                    //  decoration: BoxDecoration(border: Border.all()),
                    child: IconButton(
                      icon: const Icon(Icons.keyboard_backspace_outlined),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Beranda(),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                      width: screenWidth * 0.6,
                      //  decoration: BoxDecoration(border: Border.all()),
                      child: const Center(
                        child: Text('SEARCH',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      //  borderSide: const BorderSide(color: Colors.lightBlue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 209, 209, 209),
                        width: 2,
                      ), // Ubah warna outline saat tidak dalam keadaan fokus
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                        top: 0, right: 30, bottom: 0, left: 15),
                    hintText: 'cari teknisi terdekat...',
                    suffixIcon: GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   showPassword = !showPassword;
                        // });
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(left: 10, right: 15),
                        child: Icon(
                          Icons.search,
                          color: Color.fromARGB(255, 0, 0, 0),
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: screenHeigth * 0.76,
                width: screenWidth,
                child: ListView.builder(
                  itemCount: listsData.length,
                  itemBuilder: (context, index) {
                    return CardList(listData: listsData[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<String> listData;

  CardList({required this.listData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 8, left: 8, top: 4, bottom: 4),
        child: Card(
          margin: const EdgeInsets.all(4),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    '${listData[0]}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              color: Colors.black12, shape: BoxShape.circle),
                          child: Icon(
                            Icons.person,
                            size: 70,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: Container(
                          //  color: Colors.amberAccent,
                          width: 210,
                          height: 100,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                                child: Text(
                                  'Nama : ${listData[1]}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Text(
                                  'Keahlian : ${listData[2]}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Text(
                                  'Pengalaman : ${listData[3]}',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                                child: Text(
                                  'Jarak : > ${listData[4]} KM',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // const Divider(
                //   height: 0.5,
                // ),
                // ListView.builder(
                //   itemCount: listData.length,
                //   shrinkWrap: true,
                //   physics: const NeverScrollableScrollPhysics(),
                //   itemBuilder: (context, index) {
                //     return ListTile(
                //         //   title: Text(listData[index]),
                //         subtitle: Row(
                //       children: <Widget>[
                //         SizedBox(width: 100, child: Icon(Icons.abc)),
                //         SizedBox(
                //           width: 150,
                //           child: Column(
                //             children: <Widget>[
                //               Text('nama :'),
                //               Text('Keahlian :'),
                //               Text('Pengalaman :')
                //             ],
                //           ),
                //         )
                //       ],
                //     ),);
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
