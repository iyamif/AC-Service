import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teknisi/ui/beranda.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    List<List<String>> listsData = [
      ['Item 1', 'Item 2', 'Item 3'],
      ['Item A', 'Item B', 'Item C', 'Item D'],
      ['Item X', 'Item Y', 'Item Z'],
      ['Item P', 'Item Q', 'Item R'],
      ['Item M', 'Item N', 'Item O'],
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: screenWidth * 0.13,
                    //  decoration: BoxDecoration(border: Border.all()),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Color.fromARGB(255, 9, 31, 110),
                        size: 20,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Beranda(),
                          ),
                        );
                      },
                    )),
                const Text(
                  'Riwayat',
                  style: TextStyle(fontWeight: FontWeight.normal),
                ),
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
            SizedBox(
              width: screenWidth,
              child: CupertinoButton(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      //   color: Colors.transparent,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(width: 0.2)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/perawatan.png',
                          width: 30,
                          height: 30,
                          //  color: Color.fromARGB(255, 1, 5, 122),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 280,
                      //   color: Colors.amber,
                      child: Text(
                        'Perawatan AC',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Divider(
                height: 2,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: CupertinoButton(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      //   color: Colors.transparent,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(width: 0.2)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/tambah_freon.png',
                          width: 30,
                          height: 30,
                          //  color: Color.fromARGB(255, 1, 5, 122),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 280,
                      //   color: Colors.amber,
                      child: Text(
                        'Perawatan & Tambah freon',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Divider(
                height: 2,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: CupertinoButton(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      //   color: Colors.transparent,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(width: 0.2)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/service.png',
                          width: 30,
                          height: 30,
                          //  color: Color.fromARGB(255, 1, 5, 122),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 280,
                      //   color: Colors.amber,
                      child: Text(
                        'Pemasangan AC',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Divider(
                height: 2,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: screenWidth,
              child: CupertinoButton(
                color: Colors.white,
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 60,
                      //   color: Colors.transparent,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                          border: Border.all(width: 0.2)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          'assets/images/house.png',
                          width: 30,
                          height: 30,
                          //  color: Color.fromARGB(255, 1, 5, 122),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 280,
                      //   color: Colors.amber,
                      child: Text(
                        'Bongkar & Pasang AC',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                      color: Colors.grey,
                    ),
                  ],
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text('Riwayat Pesanan'),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Tandai sudah di baca',
                        style:
                            TextStyle(color: Color.fromARGB(255, 2, 57, 153)),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 400,
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
    );
  }
}

class CardList extends StatelessWidget {
  final List<String> listData;

  CardList({required this.listData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.only(top: 2),
        child: Column(
          children: [
            ListTile(
              title: Text(
                'Judul ${listData[0]}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const Divider(
              height: 0.5,
            ),
            ListView.builder(
              itemCount: listData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(listData[index]),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
