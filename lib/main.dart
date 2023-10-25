import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknisi/services/res_client.dart';
import 'package:teknisi/ui/beranda.dart';
import 'package:teknisi/ui/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences localStorage = await SharedPreferences.getInstance();
  var token = localStorage.getString('token');

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: token == null
          ? const MyHomePage(
              title: 'Teknisi',
            )
          : const Beranda(),
    ),
  );

  // runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter',
//       debugShowCheckedModeBanner: false,
//       scrollBehavior: MyCustomScrollBehavior(),
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const Scaffold(
//         body: SingleChildScrollView(
//           child: MyHomePage(title: 'Teknis'),
//         ),
//       ),
//     );
//   }
// }

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isLoading = false;
  bool showPassword = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> _beranda() async {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Beranda()),
    );
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    return Container(
      width: double.infinity,
      child: Container(
        // iphone13mini1LeL (636:6)
        padding: EdgeInsets.fromLTRB(45 * fem, 56 * fem, 45 * fem, 238 * fem),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(20 * fem),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // autogroupe4zeUXa (JnjEU72CN1ube52Swje4Ze)
              margin:
                  EdgeInsets.fromLTRB(13 * fem, 0 * fem, 23 * fem, 30 * fem),
              padding:
                  EdgeInsets.fromLTRB(16 * fem, 222 * fem, 21 * fem, 14 * fem),
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/b3071185f13ddead6c6fb6ab1142e06b-1-bg.png',
                  ),
                ),
              ),
              child: Text(
                'TEKNISI AC JAKARTA',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 20 * ffem,
                  fontWeight: FontWeight.w700,
                  height: 1.3 * ffem / fem,
                  color: const Color(0xff056089),
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.2),
                      // color: const Color.fromARGB(255, 214, 214, 214),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(
                              255, 239, 239, 239), // Warna bayangan
                          offset: Offset(0,
                              1), // Perpindahan bayangan horizontal dan vertikal
                          blurRadius: 2, // Radius blur bayangan
                          spreadRadius: 1, // Sebaran bayangan
                        ),
                      ],
                    ),
                    width: 375,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          decoration: const BoxDecoration(
                              // border: Border.all(),
                              //color: Colors.blueGrey,
                              ),
                          child: const Icon(Icons.person_2_outlined),
                        ),
                        Container(
                          width: 250,
                          decoration: const BoxDecoration(
                              //   border: Border.all(),
                              ),
                          child: Center(
                            child: TextFormField(
                              key: const Key('username'),
                              controller: _usernameController,
                              decoration: const InputDecoration(
                                  //   labelText: 'Username',
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Username'),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return '* wajib diisi';
                                }
                                return null;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(width: 0.2),
                      // color: const Color.fromARGB(255, 214, 214, 214),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(
                              255, 234, 233, 233), // Warna bayangan
                          offset: Offset(0,
                              1), // Perpindahan bayangan horizontal dan vertikal
                          blurRadius: 2, // Radius blur bayangan
                          spreadRadius: 1, // Sebaran bayangan
                        ),
                      ],
                    ),
                    width: 375,
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 40,
                          decoration: const BoxDecoration(
                              // border: Border.all(),
                              //color: Colors.blueGrey,
                              ),
                          child: const Icon(Icons.lock_outline),
                        ),
                        Container(
                          width: 250,
                          decoration: const BoxDecoration(
                              //   border: Border.all(),
                              ),
                          child: Center(
                            child: TextFormField(
                              key: const Key('password'),
                              controller: _passwordController,
                              obscureText: showPassword ? false : true,
                              decoration: InputDecoration(
                                //   labelText: 'Username',
                                border: const OutlineInputBorder(
                                    borderSide: BorderSide.none),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Password',
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      showPassword = !showPassword;
                                    });
                                  },
                                  child: Icon(
                                    showPassword
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black,
                                    size: 18,
                                  ),
                                ),
                              ),
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: ((value) {
                                if (value == null || value.isEmpty) {
                                  return "* wajib diisi";
                                }
                                return null;
                              }),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              // lupapasswordg9n (638:3)
              margin: EdgeInsets.fromLTRB(183 * fem, 0 * fem, 0 * fem, 6 * fem),
              child: Text(
                'Lupa Password ?',
                style: SafeGoogleFont(
                  'Inter',
                  fontSize: 12 * ffem,
                  fontWeight: FontWeight.w400,
                  height: 1.2999999523 * ffem / fem,
                  color: const Color(0xff000000),
                ),
              ),
            ),
            Container(
              // autogroupressNoJ (JnjEq1b2bCKwZhHqfJrEsS)
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 7 * fem),
              width: double.infinity,
              height: 55 * fem,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      // autogroup6zuiVd2 (JnjEwktnaNAEd8rmSP6Zui)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 15 * fem, 0 * fem),
                      width: 214 * fem,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: const Color(0xff007eb6),
                        borderRadius: BorderRadius.circular(10 * fem),
                      ),
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _login();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                const Color.fromARGB(255, 4, 74, 124)),
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.all(16)),
                            minimumSize: MaterialStateProperty.all(Size(
                              214 * fem,
                              214 * fem,
                            )),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // Atur radius sesuai kebutuhan
                              ),
                            ),
                          ),
                          child: Text(
                            'Login',
                            style: SafeGoogleFont(
                              'Inter',
                              fontSize: 20 * ffem,
                              fontWeight: FontWeight.w700,
                              height: 1.3 * ffem / fem,
                              color: const Color(0xffffffff),
                            ),
                          ),
                        ),
                      )),
                  Container(
                    // autogroupnvkg9ha (JnjF1b7jdUTdv8LmuQnvkG)
                    width: 50 * fem,
                    // padding: EdgeInsets.fromLTRB(
                    //     8.45 * fem, 11.14 * fem, 5.06 * fem, 9.04 * fem),
                    height: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xff007eb6),
                      borderRadius: BorderRadius.circular(10 * fem),
                    ),
                    child: ElevatedButton(
                        onPressed: () {
                          _beranda();
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color.fromARGB(255, 4, 74, 124)),
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(16)),
                          minimumSize: MaterialStateProperty.all(Size(
                            50 * fem,
                            50 * fem,
                          )),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  10.0), // Atur radius sesuai kebutuhan
                            ),
                          ),
                        ),
                        child: Center(
                          // fingerdse (636:19)
                          child: SizedBox(
                            width: 50 * fem,
                            height: 50 * fem,
                            child: Image.asset(
                              'assets/images/finger.png',
                              width: 42.49 * fem,
                              height: 34.81 * fem,
                            ),
                          ),
                        )),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0 * fem, 0 * fem, 9 * fem, 0 * fem),
              child: RichText(
                text: TextSpan(
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 12 * ffem,
                    fontWeight: FontWeight.w400,
                    height: 1.2999999523 * ffem / fem,
                    color: const Color(0xff000000),
                  ),
                  children: [
                    TextSpan(
                      text: 'Belum Punya Akun ? ',
                      style: SafeGoogleFont(
                        'Inter',
                        fontSize: 12 * ffem,
                        fontWeight: FontWeight.w400,
                        height: 1.2999999523 * ffem / fem,
                        color: const Color(0xff000000),
                      ),
                    ),
                    TextSpan(
                        text: 'Daftar sekarang !',
                        style: SafeGoogleFont(
                          'Inter',
                          fontSize: 12 * ffem,
                          fontWeight: FontWeight.w700,
                          height: 1.2999999523 * ffem / fem,
                          color: const Color(0xff000000),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            _showBottomSheet(context);
                          }),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context) {
    TextEditingController _textEditingController = TextEditingController();

    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0), // Atur radius top sesuai kebutuhan Anda
        ),
      ),
      //  backgroundColor: Color.fromARGB(255, 241, 243, 245),
      builder: (BuildContext context) {
        return Container(
          //  height: d
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                "REGISTRASI AKUN",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 1, 78, 117)),
              ),
              const SizedBox(height: 9.0),
              TextFormField(
                controller: _textEditingController,
                style: SafeGoogleFont('Inter',
                    fontStyle: FontStyle.italic,
                    color: const Color.fromARGB(255, 7, 165, 222),
                    fontSize: 13.0),
                decoration: const InputDecoration(
                  labelText: "Nama Lengkap",
                  labelStyle: TextStyle(color: Color.fromARGB(255, 1, 96, 113)),
                ),
              ),
              const SizedBox(height: 9.0),
              TextFormField(
                controller: _textEditingController,
                style: SafeGoogleFont('Inter',
                    fontStyle: FontStyle.italic,
                    color: const Color(0xffbebdbd),
                    fontSize: 13.0),
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                ),
              ),
              const SizedBox(height: 9.0),
              TextFormField(
                controller: _textEditingController,
                style: SafeGoogleFont('Inter',
                    fontStyle: FontStyle.italic,
                    color: const Color(0xffbebdbd),
                    fontSize: 13.0),
                decoration: const InputDecoration(
                  labelText: "No Handphone/Whatsapp",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                ),
              ),
              const SizedBox(height: 9.0),
              TextFormField(
                controller: _textEditingController,
                style: SafeGoogleFont('Inter',
                    fontStyle: FontStyle.italic,
                    color: const Color(0xffbebdbd),
                    fontSize: 13.0),
                decoration: const InputDecoration(
                  labelText: "Password",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                ),
              ),
              const SizedBox(height: 9.0),
              TextFormField(
                controller: _textEditingController,
                style: SafeGoogleFont('Inter',
                    fontStyle: FontStyle.italic,
                    color: const Color(0xffbebdbd),
                    fontSize: 13.0),
                decoration: const InputDecoration(
                  labelText: "Teknisi Code",
                  labelStyle:
                      TextStyle(color: Color.fromARGB(255, 176, 176, 176)),
                ),
              ),
              const SizedBox(height: 9.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context); // Tutup bottom sheet
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromARGB(255, 4, 74, 124)),
                  padding: MaterialStateProperty.all(const EdgeInsets.all(16)),
                  // minimumSize: MaterialStateProperty.all(Size(
                  //   25 * fem,
                  //   25 * fem,
                  // )),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          10.0), // Atur radius sesuai kebutuhan
                    ),
                  ),
                  minimumSize: MaterialStateProperty.all(Size(
                    325 * fem,
                    30 * fem,
                  )),
                ),
                child: const Text(
                  "DAFTAR",
                  style: TextStyle(
                    fontSize: 20, // Atur ukuran font
                    // Anda juga dapat menambahkan properti lain seperti fontWeight, color, dll.
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _login() async {
    setState(() {
      isLoading = true;
    });
    var data = {
      'email': _usernameController.text,
      'password': _passwordController.text
    };

    var res = await ResClient().authData(data, '/login');
    var body = json.decode(res.body);

    if (body["message"]) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Beranda()),
      );
    } else {
      // _showMsg(body['message']);
    }

    setState(() {
      isLoading = false;
    });
  }
}
