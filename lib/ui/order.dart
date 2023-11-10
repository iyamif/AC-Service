import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teknisi/ui/notif.dart';
import 'beranda.dart';
import 'package:intl/intl.dart';

class Order extends StatefulWidget {
  const Order({Key? key, required this.nama, required this.kode})
      : super(key: key);

  final String nama;
  final String kode;

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  final _formKey = GlobalKey<FormState>();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  List<bool> isSelected = [
    true,
    false,
    false,
    false,
  ];

  Color selectedColor =
      const Color.fromARGB(255, 248, 248, 248); // Warna pilihan yang dipilih
  Color unselectedColor = const Color.fromARGB(255, 7, 62, 107);
  double borderWidth = 0.5;

  final TextEditingController textController = TextEditingController();
  final TextEditingController detailController = TextEditingController();
  final TextEditingController deskriptionController = TextEditingController();

  int notificationCount = 3;

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateController.text =
            DateFormat('EEEE, dd-MM-yyyy').format(selectedDate);
      });
    }
  }

  void selectOption(int index) {
    for (int i = 0; i < isSelected.length; i++) {
      isSelected[i] = i == index;
    }
    setState(() {});
  }

  // void _handleSelection(int index) {
  //   setState(() {
  //     isSelected[index] = !isSelected[index];
  //     _isButtonEnabled = isSelected.any((isSelected) => isSelected);
  //   });
  // }

  Future<void> _selectTime(BuildContext context) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedTime) {
      setState(() {
        selectedTime = picked;
        timeController.text = picked.format(context);
      });
    }
  }

  void sendDataToApi() async {
    final textValue = textController.text;
    final detailLocation = detailController.text;
    final description = deskriptionController.text;
    final date = dateController.text;
    final time = timeController.text;
    final selectedOptionIndex = isSelected.indexWhere((element) => element);

    if (selectedOptionIndex == -1) {
      // Tidak ada opsi yang dipilih
      print("Pilih salah satu opsi");
      return;
    }

    final data = {
      "tipeLocation": "Tipe ${selectedOptionIndex + 1}",
      "currentLocation": textValue,
      "detailLocation": detailLocation,
      "date": date,
      "time": time,
      "deskription": description,
    };
    print(data);

    // final apiUrl = "URL_API_ANDA"; // Ganti dengan URL API yang sesuai
    // final response = await http.post(Uri.parse(apiUrl),
    //     headers: {"Content-Type": "application/json"}, body: jsonEncode(data));

    // if (response.statusCode == 200) {
    //   // Sukses mengirim data ke API
    //   print("Data berhasil dikirim ke API");
    // } else {
    //   // Gagal mengirim data ke API
    //   print("Gagal mengirim data ke API");
    // }
  }

  TextEditingController _textController = TextEditingController();
  bool _isButtonEnabled = false;

  void _checkTextField() {
    if (deskriptionController.text.isNotEmpty &&
        _textController.text.isNotEmpty &&
        detailController.text.isNotEmpty &&
        dateController.text.isNotEmpty &&
        timeController.text.isNotEmpty &&
        isSelected.any((isSelected) => isSelected)) {
      setState(() {
        _isButtonEnabled = true;
      });
    } else {
      setState(() {
        _isButtonEnabled = false;
      });
    }
    // setState(() {
    //   if (deskriptionController.text.isNotEmpty &&
    //       _textController.text.isNotEmpty) {
    //     _isButtonEnabled = true;
    //   } else {
    //     _isButtonEnabled = false;
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);

    // Mengambil lebar layar perangkat
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    // bool _isToggled = false;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        child: Text('ORDER MENU',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            )),
                      )),
                  Toggle(
                    icon: const Icon(
                      Icons.notifications_outlined,
                      size: 30,
                    ),
                    badgeCount: notificationCount,
                    onPressed: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: (context) => const History(),
                      //   ),
                      // );
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: screenWidth * 0.95,
                  height: screenHeight * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color.fromARGB(255, 255, 255, 255),
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(height: 20),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, top: 0, bottom: 4),
                          child: Text(
                            'Pilih Tipe lokasi anda ?',
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ToggleButtons(
                        isSelected: isSelected,
                        onPressed: selectOption,
                        fillColor: Colors.transparent,
                        selectedColor: const Color.fromARGB(255, 0, 0, 0),
                        focusColor: Color.fromARGB(255, 6, 202, 241),
                        hoverColor: Colors.lightBlue,
                        borderColor: Colors.transparent,
                        selectedBorderColor: Colors.transparent,
                        //  borderRadius: BorderRadius.circular(10),
                        borderWidth: 2,
                        disabledColor: Colors.grey,
                        splashColor: Colors.transparent,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: isSelected[0]
                                          ? Color.fromARGB(255, 163, 221, 245)
                                          : const Color.fromARGB(
                                              255, 255, 255, 255),
                                      // shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset(
                                      'assets/images/houses.png',
                                      // width: 60,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const Text(
                                  'Rumah',
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: isSelected[1]
                                          ? Color.fromARGB(255, 235, 214, 112)
                                          : const Color.fromARGB(
                                              255, 255, 255, 255),
                                      // shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset(
                                      'assets/images/apart.png',
                                      // width: 60,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const Text('Apartement')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: isSelected[2]
                                          ? Color.fromARGB(255, 224, 226, 227)
                                          : const Color.fromARGB(
                                              255, 255, 255, 255),
                                      //  shape: BoxShape.circle,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset(
                                      'assets/images/shop.png',
                                      // width: 60,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const Text('Ruko')
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, right: 5),
                            child: Column(
                              children: [
                                Container(
                                  width: 70,
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: isSelected[3]
                                          ? Color.fromARGB(255, 200, 189, 212)
                                          : const Color.fromARGB(
                                              255, 255, 255, 255),
                                      //  shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15),
                                    child: Image.asset(
                                      'assets/images/rumah.png',
                                      // width: 60,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const Text('Kost')
                              ],
                            ),
                          ),
                        ],
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
                    'Lokasi Pengerjaan',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: const Key('location'),
                  controller: _textController,
                  onChanged: (value) {
                    _checkTextField(); // Cek TextField saat nilai berubah
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* wajib diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.lightBlue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 189, 190, 190),
                        width: 1,
                      ), // Ubah warna outline saat tidak dalam keadaan fokus
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                        top: 0, right: 30, bottom: 0, left: 15),
                    hintText: 'Lokasi saat ini',
                    prefixIcon: GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   showPassword = !showPassword;
                        // });
                      },
                      child: Padding(
                        // padding: const EdgeInsets.only(
                        //     left: 10, right: 15, top: 10, bottom: 10),
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          'assets/images/send.png',
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: TextFormField(
                  key: const Key('username'),
                  controller: detailController,
                  onChanged: (value) {
                    _checkTextField(); // Cek TextField saat nilai berubah
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* wajib diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.lightBlue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 189, 190, 190),
                        width: 1,
                      ), // Ubah warna outline saat tidak dalam keadaan fokus
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                        top: 25, right: 30, bottom: 25, left: 15),
                    hintText: 'Detail Lokasi lebih akurat',
                    prefixIcon: GestureDetector(
                      onTap: () {
                        // setState(() {
                        //   showPassword = !showPassword;
                        // });
                      },
                      child: Padding(
                        // padding: const EdgeInsets.only(
                        //     left: 10, right: 15, top: 10, bottom: 10),
                        padding: const EdgeInsets.all(15),
                        child: Image.asset(
                          'assets/images/rumah.png',
                          width: 10,
                          height: 10,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Waktu Pengerjaan',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: screenWidth * 0.62,
                    height: 50,
                    // decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(14),
                    //     color: Color.fromARGB(255, 255, 255, 255),
                    //     border: Border.all(width: 0.5)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1, right: 3),
                      child: TextFormField(
                        controller: dateController,
                        onChanged: (value) {
                          _checkTextField(); // Cek TextField saat nilai berubah
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              color: Color.fromARGB(255, 189, 190, 190),
                              width: 1,
                            ), // Ubah warna outline saat tidak dalam keadaan fokus
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.only(
                              top: 0, right: 30, bottom: 0, left: 15),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                const BorderSide(color: Colors.lightBlue),
                          ),
                          hintText: 'Tanggal (dd/mm/yyyy)',
                          prefixIcon: IconButton(
                            icon: Image.asset(
                              'assets/images/calendar.png',
                              width: 18,
                              height: 18,
                            ),
                            onPressed: () async {
                              _selectDate(context);
                            },
                          ),
                        ),
                        //  readOnly: true,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 10,
                  // ),
                  Container(
                    width: screenWidth * 0.27,
                    height: 50,
                    child: TextFormField(
                      controller: timeController,
                      onChanged: (value) {
                        _checkTextField(); // Cek TextField saat nilai berubah
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Color.fromARGB(255, 189, 190, 190),
                            width: 1,
                          ), // Ubah warna outline saat tidak dalam keadaan fokus
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.only(
                            top: 0, right: 60, bottom: 0, left: 14),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.lightBlue),
                        ),
                        hintText: 'Jam',
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.access_time),
                          onPressed: () => _selectTime(context),
                        ),
                      ),
                      readOnly: true,
                    ),
                  )
                ],
              ),
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
              Container(
                //    height: 100,
                // color: Colors.white,
                padding: const EdgeInsets.only(left: 8, right: 8, top: 3),
                child: TextFormField(
                  key: const Key('username'),
                  controller: deskriptionController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (value) {
                    _checkTextField(); // Cek TextField saat nilai berubah
                  },
                  maxLines: null,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '* wajib diisi';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.lightBlue),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 189, 190, 190),
                        width: 1,
                      ), // Ubah warna outline saat tidak dalam keadaan fokus
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(
                        top: 50, right: 30, bottom: 10, left: 15),
                    hintText: 'Masukan deskripsi kerusakan disini',
                    //  hintStyle: TextStyle(color: Colors.black)

                    // prefixIcon: GestureDetector(
                    //   onTap: () {
                    //     // setState(() {
                    //     //   showPassword = !showPassword;
                    //     // });
                    //   },
                    //   child: Padding(
                    //     // padding: const EdgeInsets.only(
                    //     //     left: 10, right: 15, top: 10, bottom: 10),
                    //     padding: EdgeInsets.all(15),
                    //     child: Image.asset(
                    //       'assets/images/send.png',
                    //       width: 10,
                    //       height: 10,
                    //     ),
                    //   ),
                    // ),
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
                  width: 250,
                  //  color: Colors.amber,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 3),
                        child: Container(
                          width: double.infinity,
                          child: const Text(
                            'Kategori :',
                            textAlign: TextAlign.left,
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                      ),
                      Container(
                        //  padding: EdgeInsets.only(left: 10),
                        width: double.infinity,
                        //   color: Colors.amber,
                        child: Text(widget.nama,
                            textAlign: TextAlign.left,
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 18, 0, 120))),
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
                      color: _isButtonEnabled
                          ? Color.fromARGB(255, 0, 51, 159)
                          : Colors.grey
                      //   color: const Color.fromARGB(255, 107, 107, 107),
                      ),
                  child: TextButton(
                    onPressed: _isButtonEnabled
                        ? () {
                            // Aksi saat tombol ditekan
                            sendDataToApi();
                            print('Button Pressed');
                          }
                        : null,
                    child: const Text(
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

class ToggleBadgeNotification extends StatelessWidget {
  final Icon icon;
  final int badgeCount;
  final VoidCallback onPressed;

  ToggleBadgeNotification(
      {required this.icon, required this.badgeCount, required this.onPressed});

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
