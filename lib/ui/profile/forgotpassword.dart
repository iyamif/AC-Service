import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teknisi/main.dart';
import 'package:teknisi/services/res_client.dart';

class password extends StatefulWidget {
  const password({super.key});

  @override
  State<password> createState() => _passwordState();
}

class _passwordState extends State<password> {
  bool isLoading = false;
  bool visible = false;
  String buttonText = 'VERIFIKASI EMAIL';
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> verifEmail() async {
    setState(() {
      isLoading = true;
    });

    final data = {'email': _emailController.text};

    var res = await ResClient().emailVerification('/verification', data);

    var body = json.decode(res.body);
    if (body['status']) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          visible = !visible;
          buttonText = visible ? 'RESET PASSWORD' : 'Function 2';
          isLoading = false;
        });
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
        });
      });
    }
  }

  Future<void> resetPassword() async {
    setState(() {
      isLoading = true;
    });
    final data = {
      'email': _emailController.text,
      'password': _passwordController.text
    };
    var res = await ResClient().reset('/reset', data);
    var body = json.decode(res.body);

    if (body['status']) {
      Future.delayed(Duration(seconds: 2), () {
        setState(() {
          isLoading = false;
          final snackBar = SnackBar(
            content: Text('Password berhasil di update !'),
            // backgroundColor: (Colors.white24),
            behavior: SnackBarBehavior.floating,
            action: SnackBarAction(
              label: '',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => const MyHomePage(
                    title: 'teknisi',
                  )),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeigth = mediaQueryData.size.height;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const MyHomePage(
                                  title: 'teknisi',
                                )),
                      );
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(
                height: 40,
              ),
              Center(
                child: SizedBox(
                  height: screenHeigth * 0.7,
                  width: screenWidth * 0.8,
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth,
                          child: const Text(
                            'Lupa',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth,
                          child: const Text(
                            'Password ?',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                                borderSide:
                                    const BorderSide(color: Colors.lightBlue),
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
                              hintText: 'masukan email disini',
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  // setState(() {
                                  //   showPassword = !showPassword;
                                  // });
                                },
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 10, right: 15),
                                  child: Icon(
                                    Icons.email_sharp,
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    size: 20,
                                  ),
                                ),
                              ),
                              suffixIcon: visible
                                  ? Icon(
                                      Icons.verified,
                                      color: Color.fromARGB(255, 8, 24, 163),
                                    )
                                  : null),
                        ),
                        Visibility(
                          visible: visible,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10,
                            ),
                            child: TextFormField(
                              controller: _passwordController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide:
                                      const BorderSide(color: Colors.black),
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
                                hintText: 'masukan password baru disini',
                                prefixIcon: GestureDetector(
                                  onTap: () {
                                    // setState(() {
                                    //   showPassword = !showPassword;
                                    // });
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.only(left: 10, right: 15),
                                    child: Icon(
                                      Icons.lock,
                                      color: Color.fromARGB(255, 0, 0, 0),
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 50,
                            width: screenWidth * 0.8,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 74, 1, 176),
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Color.fromARGB(255, 74, 1, 176),
                                  Color.fromARGB(255, 69, 2, 162),
                                ], // Warna gradient
                              ),
                            ),
                            child: CupertinoButton(
                              onPressed: () {
                                if (!visible) {
                                  verifEmail();
                                } else {
                                  resetPassword();
                                }
                              },
                              child: (isLoading)
                                  ? SizedBox(
                                      height: 80,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                          color: Colors.white
                                          // strokeWidth: 1.5,
                                          ),
                                    )
                                  : Center(
                                      child: Text(
                                        buttonText,
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                            ),
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
      ),
    );
  }
}
