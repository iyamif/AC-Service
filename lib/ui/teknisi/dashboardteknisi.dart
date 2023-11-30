import 'dart:convert';
import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:teknisi/services/chart_data.dart';
import 'package:teknisi/services/res_client.dart';
import 'package:teknisi/ui/history.dart';
import 'package:teknisi/ui/order.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknisi/ui/teknisi/history_teknisi.dart';

class DashboardTeknisi extends StatefulWidget {
  const DashboardTeknisi({super.key});

  @override
  _DashboardTeknisiState createState() => _DashboardTeknisiState();
}

class _DashboardTeknisiState extends State<DashboardTeknisi> {
  int notificationCount = 3;
  bool container = false;
  bool visible = false;
  String? name;
  String? namaTeknisi;
  late List<ChartData> data;
  String nama = "user";

  // Future<void> _notification() async {
  //   NotificationManager notificationManager = NotificationManager();
  //   await notificationManager.initializeNotifications();
  //   Future.delayed(Duration(seconds: 5), () {
  //     notificationManager.showNotification(
  //         'Alarm', 'Waktunya untuk sesuatu!', 0);
  //   });
  // }

  Future<void> fetchData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token') ?? '';
    setState(() {
      String namas = prefs.getString('name') ?? 'user';
      nama = namas.replaceAll('"', '');
      //   print(nama);
    });

    var res = await ResClient().getOrders('/get-order', token);
    var body = json.decode(res.body);
    print(body['data']);

    if (body['data'] != null) {
      var state = json.encode(body['data']['state']);

      if (state == '1') {
        namaTeknisi = json.encode(body['data']['teknisi_id']);
        //  print(namaTeknisi);
        setState(() {
          container = container;
        });
      } else if (state == '2') {
        setState(() {
          container = !container;
        });
      }
      setState(() {
        visible = !visible;
      });
    } else {
      setState(() {
        visible = visible;
      });
    }
    // print(data);
  }

  @override
  void initState() {
    var data = [
      ChartData(0, 10),
      ChartData(1, 15),
      ChartData(2, 13),
      ChartData(3, 18),
      ChartData(4, 11),
      ChartData(5, 12),
      ChartData(6, 19),
    ];
    super.initState();

    fetchData();
  }

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
    double screenHeigth = mediaQueryData.size.height;
    double screenWidth = mediaQueryData.size.width;

    List<List<String>> listsData = [
      ['Henry', 'Item 2'],
      ['Heri', 'Item 2'],
      ['andri', 'Item 2'],
      ['rio', 'Item 2'],
      ['rio', 'Item 2'],
      ['rio', 'Item 2'],
    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: screenWidth,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        width: screenWidth * 0.1,
                        child: const CircleAvatar(
                          backgroundColor: Colors.grey,
                        ),
                      ),
                      SizedBox(
                          width: screenWidth * 0.75,
                          child: Text(
                            nama,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                      ToggleBadgeNotification(
                        icon: const Icon(
                          Icons.notifications_outlined,
                          size: 30,
                        ),
                        badgeCount: notificationCount,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const History(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: SizedBox(
                    height: 140,
                    child: SfCartesianChart(
                      plotAreaBorderWidth: 0,
                      margin: const EdgeInsets.all(0),
                      borderWidth: 0,
                      borderColor: Colors.transparent,
                      primaryYAxis: NumericAxis(
                          minimum: 0, maximum: 20, isVisible: false),
                      primaryXAxis: NumericAxis(
                        isVisible: false,
                        minimum: 1,
                        maximum: 7,
                        interval: 1,
                        axisLine: const AxisLine(width: 0),
                        majorGridLines:
                            const MajorGridLines(width: 0, color: Colors.amber),
                      ),
                      series: <ChartSeries<ChartData, int>>[
                        SplineAreaSeries(
                          dataSource: data = [
                            ChartData(0, 10),
                            ChartData(1, 15),
                            ChartData(2, 13),
                            ChartData(3, 18),
                            ChartData(4, 11),
                            ChartData(5, 12),
                            ChartData(6, 19),
                            ChartData(7, 9),
                            ChartData(8, 30),
                          ],
                          xValueMapper: (ChartData data, _) => data.day,
                          yValueMapper: (ChartData data, _) => data.prince,
                          splineType: SplineType.natural,
                          gradient: LinearGradient(
                            colors: [
                              const Color.fromARGB(255, 14, 147, 255)
                                  .withOpacity(1),
                              const Color.fromARGB(255, 255, 255, 255)
                                  .withAlpha(80),
                              //  Colors.transparent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        SplineSeries(
                            dataSource: data,
                            xValueMapper: (ChartData data, _) => data.day,
                            yValueMapper: (ChartData data, _) => data.prince,
                            width: 2,
                            markerSettings: const MarkerSettings(
                                color: Color.fromARGB(255, 65, 168, 253),
                                //   borderWidth: 0.2,
                                height: 4,
                                width: 4,
                                shape: DataMarkerType.circle,
                                isVisible: true),
                            color: const Color.fromARGB(255, 0, 50, 91))
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.9,
                  height: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        //    color: Colors.amber,
                        height: 90,
                        width: 90,
                        child: CupertinoButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const historyTeknisi(),
                              ),
                            );
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/perawatan.png',
                                  width: 40, height: 40),
                              const Text(
                                'Perawatan AC',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 90,
                        width: 90,
                        //  color: Colors.amber,
                        child: CupertinoButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/tambah_freon.png',
                                  width: 40, height: 40),
                              const Text(
                                'Tambah',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              ),
                              const Text(
                                'Freon AC',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        width: 80,
                        child: CupertinoButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/service.png',
                                  width: 40, height: 40),
                              const Text(
                                'Pemasangan AC',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 90,
                        width: 80,
                        child: CupertinoButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('assets/images/house.png',
                                  width: 40, height: 40),
                              const Text(
                                'Bongkar',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              ),
                              const Text(
                                'Pasang AC',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 8,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 4, left: 4),
                    child: Container(
                      width: screenWidth * 0.9,
                      alignment: Alignment.centerLeft,
                      child: const Text(
                        'Maintainance Customer',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: visible,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, left: 15, right: 15, bottom: 4),
                    child: Container(
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
                        child: CupertinoButton(
                          onPressed: () {
                            showBottomSheet(
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                    height: 200,
                                    color: Colors.white,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          const Text('Modal BottomSheet'),
                                          ElevatedButton(
                                            child:
                                                const Text('Close BottomSheet'),
                                            onPressed: () =>
                                                Navigator.pop(context),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                alignment: Alignment.centerLeft,
                                width: 200,
                                height: 70,
                                child: const Column(
                                  //   mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      'ILHAM FIRMANSYAH',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Jln. Cikoko Pancoran no.10 Jakarta Selatan',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 13,
                                      ),
                                    ),
                                    Text(
                                      'Perawatan ulang : 1 November 2023',
                                      style: TextStyle(fontSize: 13),
                                    )
                                  ],
                                ),
                                //   color: Colors.amber,
                              ),
                              CircularPercentIndicator(
                                radius: 35,
                                lineWidth: 13,
                                percent: 0.7,
                                progressColor:
                                    const Color.fromARGB(255, 168, 18, 7),
                                backgroundColor:
                                    const Color.fromARGB(255, 220, 220, 220),
                                circularStrokeCap: CircularStrokeCap.round,
                                center: const Text(
                                  '3 Hari',
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.red),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, left: 8, bottom: 2),
                  child: SizedBox(
                    width: screenWidth * 0.9,
                    child: const Text(
                      'Daftar Customer',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeigth * 0.6,
                  width: screenWidth * 0.9,
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
      ),
    );
  }
}

class CardList extends StatelessWidget {
  final List<String> listData;

  const CardList({super.key, required this.listData});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 255, 255, 255),
        //   border: Border.all(width: 1.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(255, 240, 237, 237), // Warna bayangan
            offset:
                Offset(0, 1), // Perpindahan bayangan horizontal dan vertikal
            blurRadius: 3, // Radius blur bayangan
            spreadRadius: 1, // Sebaran bayangan
          ),
        ],
      ),
      child: const Row(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              radius: 30,
              child: Text(
                'A',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Hendri',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text('new order damn'),
            ],
          ),
        ],
      ),
      // Column(
      //   children: [
      //     ListTile(
      //       title: Text(
      //         '${listData[0]}',
      //         style: TextStyle(fontWeight: FontWeight.bold),
      //       ),
      //     ),
      //     const Divider(
      //       height: 0.5,
      //     ),
      //     ListView.builder(
      //       itemCount: listData.length,
      //       shrinkWrap: true,
      //       physics: const NeverScrollableScrollPhysics(),
      //       itemBuilder: (context, index) {
      //         // return Container(
      //         //   child: Text('hahaha'),
      //         // );
      //         return ListTile(
      //           title: Text('${listData}'),
      //           autofocus: true,
      //         );
      //       },
      //     ),
      //   ],
      // ),
    );
  }
}

class SalesData {
  SalesData(this.year, this.sales);

  final double year;
  final double sales;
}

class ToggleBadgeNotification extends StatelessWidget {
  final Icon icon;
  final int badgeCount;
  final VoidCallback onPressed;

  const ToggleBadgeNotification(
      {super.key,
      required this.icon,
      required this.badgeCount,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: InkWell(
        onTap: onPressed,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            icon,
            if (badgeCount > 0)
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red, // Warna latar belakang badge notifikasi
                  ),
                  child: Text(
                    badgeCount.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
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
