import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:teknisi/ui/profile/forgotpassword.dart';

class reset extends StatefulWidget {
  const reset({super.key});

  @override
  State<reset> createState() => _resetState();
}

class _resetState extends State<reset> {
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
                            builder: (context) => const password()),
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
                child: Container(
                  height: screenHeigth * 0.7,
                  width: screenWidth * 0.8,
                  child: Form(
                    child: Column(
                      children: [
                        SizedBox(
                          width: screenWidth,
                          child: const Text(
                            'Reset',
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth,
                          child: const Text(
                            'Password anda !',
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
                            hintText: 'masukan password disini',
                            prefixIcon: GestureDetector(
                              onTap: () {
                                // setState(() {
                                //   showPassword = !showPassword;
                                // });
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10, right: 15),
                                child: Icon(
                                  Icons.lock_open_sharp,
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  size: 20,
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
                            //  width: screenWidth * 0.75,
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
                              onPressed: () async {
                                // Navigator.pushReplacement(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => const ()),
                                // );
                              },
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      //   height: 10,
                                      ),
                                  Text(
                                    'RESET PASSWORD',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                      //   height: 10,
                                      ),
                                  // Icon(
                                  //   Icons.arrow_forward_ios,
                                  //   color: Colors.white,
                                  // ),
                                ],
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
