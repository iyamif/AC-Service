import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:teknisi/main.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isLoading = false;
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emaildController = TextEditingController();
  final TextEditingController _nohpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _teknisController = TextEditingController();

  void register() async {
    final name = _nameController.text;
    final email = _emaildController.text;
    final nohp = _nohpController.text;
    final password = _passwordController.text;
    final teknisi = _teknisController.text;

    final data = {
      "namaUser": name,
      "email": email,
      "noHp": nohp,
      "password": password,
      "teknisi": teknisi
    };
    print(data);
    //  Navigator.push(
    //   context,
    //   MaterialPageRoute(
    //       builder: (context) => const MyHomePage(
    //             title: 'teknisi',
    //           )),
    // );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeigth = mediaQueryData.size.height;

    return Scaffold(
      //   backgroundColor: Color.fromARGB(255, 51, 14, 103),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
          // decoration: BoxDecoration(
          //   gradient: LinearGradient(
          //     begin: Alignment.topCenter,
          //     end: Alignment.bottomRight,
          //     colors: [
          //       Color.fromARGB(255, 74, 16, 181),
          //       Color.fromARGB(255, 55, 15, 129),
          //     ], // Warna gradient
          //   ),
          // ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 3,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: screenWidth,
                    child: Text(
                      'Hallo',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: SizedBox(
                    width: screenWidth,
                    child: Text(
                      'Daftarkan Dirimu !',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeigth * 0.7,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    //    border: Border.all(width: 0.5, color: Colors.blue),
                    boxShadow: const [
                      BoxShadow(
                        color: Color.fromARGB(
                            255, 224, 224, 224), // Warna bayangan
                        offset: Offset(1,
                            1), // Perpindahan bayangan horizontal dan vertikal
                        blurRadius: 0.5, // Radius blur bayangan
                        spreadRadius: 1, // Sebaran bayangan
                      ),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'TEKNISI AC JAKARTA',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30, top: 10),
                            child: SizedBox(
                                width: screenWidth,
                                child: Text(
                                  'Nama',
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, top: 8, left: 30, right: 30),
                            child: SizedBox(
                              //   height: 50,
                              child: TextFormField(
                                controller: _nameController,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* wajib diisi';
                                  }
                                  if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                    return 'Hanya huruf yang diperbolehkan';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.lightBlue),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 231, 240, 248),
                                      width: 2,
                                    ), // Ubah warna outline saat tidak dalam keadaan fokus
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.only(
                                      top: 0, right: 30, bottom: 0, left: 15),
                                  hintText: 'masukan nama disini',
                                  prefixIcon: GestureDetector(
                                    onTap: () {
                                      // setState(() {
                                      //   showPassword = !showPassword;
                                      // });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 15),
                                      child: Icon(
                                        Icons.person_2_outlined,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                            ),
                            child: SizedBox(
                                width: screenWidth,
                                child: Text(
                                  'Email',
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, top: 8, left: 30, right: 30),
                            child: SizedBox(
                              // height: 50,
                              child: TextFormField(
                                controller: _emaildController,
                                keyboardType: TextInputType.emailAddress,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* wajib diisi';
                                  }
                                  bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                      .hasMatch(value);

                                  if (!emailValid) {
                                    return 'Alamat email tidak sah.';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.lightBlue),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 231, 240, 248),
                                      width: 2,
                                    ), // Ubah warna outline saat tidak dalam keadaan fokus
                                  ),
                                  filled: true,
                                  fillColor: Colors.transparent,
                                  contentPadding: const EdgeInsets.only(
                                      top: 0, right: 30, bottom: 0, left: 15),
                                  hintText: 'hallo@gmail.com',
                                  prefixIcon: GestureDetector(
                                    onTap: () {
                                      // setState(() {
                                      //   showPassword = !showPassword;
                                      // });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 15),
                                      child: Icon(
                                        Icons.email_outlined,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SizedBox(
                                width: screenWidth,
                                child: Text(
                                  'No Handphone',
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, top: 8, left: 30, right: 30),
                            child: SizedBox(
                              // height: 50,
                              child: TextFormField(
                                controller: _nohpController,
                                keyboardType: TextInputType.number,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* wajib diisi';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.lightBlue),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 231, 240, 248),
                                      width: 2,
                                    ), // Ubah warna outline saat tidak dalam keadaan fokus
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                      top: 0, right: 30, bottom: 0, left: 15),
                                  hintText: '081234567120',
                                  prefixIcon: GestureDetector(
                                    onTap: () {
                                      // setState(() {
                                      //   showPassword = !showPassword;
                                      // });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 15),
                                      child: Icon(
                                        Icons.phone_android_outlined,
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SizedBox(
                                width: screenWidth,
                                child: Text(
                                  'Password',
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, top: 8, left: 30, right: 30),
                            child: SizedBox(
                              //  height: 50,
                              child: TextFormField(
                                controller: _passwordController,
                                obscureText: showPassword ? false : true,
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return '* wajib diisi';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                        color: Colors.lightBlue),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: const BorderSide(
                                      color: Color.fromARGB(255, 231, 240, 248),
                                      width: 2,
                                    ), // Ubah warna outline saat tidak dalam keadaan fokus
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: const EdgeInsets.only(
                                      top: 0, right: 30, bottom: 0, left: 15),
                                  hintText: 'masukan password',
                                  suffixIcon: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        showPassword = !showPassword;
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, right: 15),
                                      child: Icon(
                                        showPassword
                                            ? Icons.visibility
                                            : Icons.visibility_off,
                                        // color: Color.fromARGB(255, 0, 0, 0),
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: SizedBox(
                                width: screenWidth,
                                child: Text(
                                  'Teknisi Code',
                                  style: TextStyle(color: Colors.grey),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, top: 8, left: 30, right: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  //color: Colors.amber,
                                  alignment: Alignment.centerLeft,
                                  //    height: 50,
                                  width: 150,
                                  child: TextFormField(
                                    controller: _teknisController,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return '* wajib diisi';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                            color: Colors.lightBlue),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: const BorderSide(
                                          color: Color.fromARGB(
                                              255, 231, 240, 248),
                                          width: 2,
                                        ), // Ubah warna outline saat tidak dalam keadaan fokus
                                      ),
                                      filled: true,
                                      fillColor: Colors.white,
                                      contentPadding: const EdgeInsets.only(
                                          top: 0,
                                          right: 30,
                                          bottom: 0,
                                          left: 15),
                                      hintText: '123',
                                      prefixIcon: GestureDetector(
                                        onTap: () {
                                          // setState(() {
                                          //   showPassword = !showPassword;
                                          // });
                                        },
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              left: 10, right: 15),
                                          child: Icon(
                                            Icons.numbers_outlined,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                // Container(
                                //   height: 50,
                                //   width: 135,
                                //   decoration: BoxDecoration(
                                //     color: Color.fromARGB(255, 74, 1, 176),
                                //     borderRadius: BorderRadius.circular(10),
                                //     gradient: LinearGradient(
                                //       begin: Alignment.topCenter,
                                //       end: Alignment.bottomCenter,
                                //       colors: [
                                //         Color.fromARGB(255, 74, 1, 176),
                                //         Color.fromARGB(255, 69, 2, 162),
                                //       ], // Warna gradient
                                //     ),
                                //   ),
                                //   child: CupertinoButton(
                                //     onPressed: () {},
                                //     child: Center(
                                //       child: Icon(
                                //         Icons.arrow_forward_ios,
                                //         color: Colors.white,
                                //       ),
                                //     ),
                                //   ),
                                // )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(
                              height: 50,
                              width: screenWidth * 0.75,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 74, 1, 176),
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Color.fromARGB(255, 74, 1, 176),
                                    Color.fromARGB(255, 69, 2, 162),
                                  ], // Warna gradient
                                ),
                              ),
                              child: CupertinoButton(
                                onPressed: register,
                                child: const Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                        //   height: 10,
                                        ),
                                    Text(
                                      'DAFTAR SEKARANG',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 25, top: 10, right: 25),
                                  child: RichText(
                                      text: TextSpan(children: [
                                    const TextSpan(
                                      text: 'Sudah punya akun?',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 13),
                                    ),
                                    TextSpan(
                                        text: ' Login',
                                        style: const TextStyle(
                                            color:
                                                Color.fromARGB(255, 7, 79, 139),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MyHomePage(
                                                        title: 'teknisi',
                                                      )),
                                            );
                                          })
                                  ])),
                                ),
                              ],
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
        )),
      ),
    );
  }
}
