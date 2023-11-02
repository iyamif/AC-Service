import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknisi/services/res_client.dart';
import 'package:teknisi/ui/beranda.dart';
import 'package:teknisi/ui/profile/signup.dart';
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
  final TextEditingController _emailController = TextEditingController();
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

    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenWidth = mediaQueryData.size.width;
    double screenHeight = mediaQueryData.size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: screenHeight * 1,
            width: screenWidth * 1,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 250,
                    width: screenWidth * 1,
                    color: Colors.white,
                    child: Image.asset(
                        'assets/images/b3071185f13ddead6c6fb6ab1142e06b-1-bg.png'),
                  ),
                ),
                Text(
                  'TEKNISI AC JAKARTA',
                  style: SafeGoogleFont(
                    'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.3 * ffem / fem,
                    color: const Color(0xff056089),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, top: 4, bottom: 4),
                          child: Text(
                            'Email',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Color.fromARGB(255, 39, 155, 249),
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          key: const Key('email'),
                          controller: _emailController,
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
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                top: 0, right: 30, bottom: 0, left: 15),
                            hintText: 'masukan email disini',
                            prefixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(left: 10, right: 15),
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
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(left: 30, top: 4, bottom: 4),
                          child: Text(
                            'Kata Sandi',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          key: const Key('password'),
                          controller: _passwordController,
                          obscureText: showPassword ? false : true,
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
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.only(
                                top: 0, right: 30, bottom: 0, left: 15),
                            hintText: 'masukan password ',
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  showPassword = !showPassword;
                                });
                              },
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 15),
                                child: Icon(
                                  showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  //  color: Color.fromARGB(255, 0, 0, 0),
                                  size: 20,
                                ),
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock_clock_outlined,
                              color: Colors.grey,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 25),
                            child: TextButton(
                                onPressed: () {},
                                child: const Text('Lupa Password ?')),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 25, right: 8),
                            child: TextButton(
                              onPressed: () async {
                                _login();
                              },
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 1, 11, 147)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.only(
                                        left: 113,
                                        right: 113,
                                        bottom: 20,
                                        top: 20)),
                              ),
                              child: (isLoading)
                                  ? SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        color: Theme.of(context).primaryColor,
                                        strokeWidth: 1.5,
                                      ),
                                    )
                                  : const Text(
                                      'Masuk',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14),
                                    ),
                            ),
                          ),
                          // const SizedBox(
                          //   width: 3.0,
                          // ),
                          TextButton(
                            onPressed: () async {},
                            style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color.fromARGB(255, 1, 11, 147)),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.all(10))),
                            child: Builder(builder: (context) {
                              return const Icon(
                                Icons.fingerprint,
                                color: Color.fromARGB(255, 220, 220, 220),
                                size: 35,
                              );
                            }),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, top: 10, right: 25),
                            child: RichText(
                                text: TextSpan(children: [
                              const TextSpan(
                                text: 'Belum punya akun?',
                                style:
                                    TextStyle(color: Colors.blue, fontSize: 13),
                              ),
                              TextSpan(
                                  text: ' Daftar sekarang',
                                  style: const TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Signup()),
                                      );
                                    })
                            ])),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _login() async {
    setState(() {
      isLoading = true;
    });

    var data = {
      'email': _emailController.text,
      'password': _passwordController.text
    };

    var res = await ResClient().authData(data, '/login');
    var body = json.decode(res.body);

    if (body["status"]) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));

      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Beranda()),
      );
    } else {
      var messageError = 'Cek Kembali Email / Password Anda';
      showMsg(messageError);
    }

    setState(() {
      isLoading = false;
    });
  }

  Future<void> showMsg(messageError) async {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('Oooopsss... Terjadi Masalah'),
              content: Text(messageError),
            ));
    return;
  }
}
