import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                      onPressed: () {},
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
                          border: Border.all(width: 1)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 1, 5, 122),
                          size: 20,
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
                      color: Colors.black,
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
                          border: Border.all(width: 1)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 1, 5, 122),
                          size: 20,
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
                      color: Colors.black,
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
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.ios_share,
                          color: Color.fromARGB(255, 1, 5, 122),
                          size: 20,
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
                          border: Border.all(width: 1, color: Colors.grey)),
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.logout,
                          color: Color.fromARGB(255, 1, 5, 122),
                          size: 20,
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
          ],
        ),
      ),
    );
  }
}
