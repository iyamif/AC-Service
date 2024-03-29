// ignore_for_file: use_build_context_synchronously

import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teknisi/services/ForGroundLocalNotification.dart';
import 'package:teknisi/services/fcm_service.dart';
import 'package:teknisi/services/res_client.dart';
import 'package:teknisi/ui/beranda.dart';
import 'package:teknisi/ui/teknisi/beranda_teknisi.dart';
import 'package:teknisi/ui/profile/forgotpassword.dart';
import 'package:teknisi/ui/profile/signup.dart';
import 'package:teknisi/ui/teknisi/history_teknisi.dart';
import 'package:teknisi/ui/utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // await Firebase.initializeApp();
}

/// Create a [AndroidNotificationChannel] for heads up notifications
AndroidNotificationChannel? channel;

final navigatorKey = GlobalKey<NavigatorState>();

bool isFlutterLocalNotificationsInitialized = false;
late final FirebaseMessaging _messaging;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

void main() async {
//  GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp()
  await FirebaseMessagingService.initialize();
  _firebaseMessagingBackgroundHandler;
  _messaging = FirebaseMessaging.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // await Permission.locationAlways.request();

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted permission');
  }

  if (!kIsWeb) {
    channel = const AndroidNotificationChannel(
      'high_importance_channel', // id
      'High Importance Notifications', // title
      description:
          'This channel is used for important notifications.', // description
      importance: Importance.high,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin!
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel!);

    /// Update the iOS foreground notification presentation options to allow
    /// heads up notifications.
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    isFlutterLocalNotificationsInitialized = true;
  }
  await FirebaseMessaging.instance.subscribeToTopic('berita');

  runApp(const MyApp());
}

Future<String?> _getToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}

// Future<String?> _getTeknisId() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   print(prefs.getString('teknisiId'));
//   return prefs.getString('teknisiId');
// }

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalNotification.initialize();
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      LocalNotification.showNotification(message);
    });

    return MaterialApp(
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //   home: const SplashScreen(),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const Beranda(),
        '/order': (context) => const historyTeknisi(),
        '/home_teknisi': (context) => const BerandaTeknisi(),
        '/login': (context) => const MyHomePage(
              title: 'teknisi',
            ),
      },
      // Set locale to ensure 24-hour format
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String teknis = '';
  @override
  void initState() {
    super.initState();
    _checkTokenAndNavigate();
    //  setupInteractedMessage();
  }

  Future<void> _checkTokenAndNavigate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String teknisiId = prefs.getString('code') ?? '';
    teknis = teknisiId.replaceAll('"', '');

    print(teknis);

    if (teknis == 'TEKNISI' && token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const BerandaTeknisi()),
      );
    } else if (token != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Beranda()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => const MyHomePage(
                  title: 'teknisi',
                )),
      );
    }
    // String? token = await _getToken();
    // String? teknisId = await _getTeknisId();
    // String initialRoute;

    // if (token != null) {
    //   initialRoute = teknisId != null ? '/home_teknisi' : '/home';
    // } else {
    //   initialRoute = '/login';
    // }

    //  String Route = ;
    // Navigasi ke layar sesuai dengan token
    //  Navigator.of(context).pushReplacementNamed(initialRoute);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          strokeWidth: 10.0,
        ),
      ),
    );
  }
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
  @override
  void initState() {
    super.initState();
    setupInteractedMessage();
  }

  Future<void> setupInteractedMessage() async {
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      _handleMessage(initialMessage);
    }
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);
  }

  void _handleMessage(RemoteMessage message) {
    Navigator.pushNamed(
      context,
      '/order',
      //  arguments: ChatArguments(message),
    );
  }

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
                  height: 25,
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
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.only(left: 25, right: 25),
                        child: TextFormField(
                          key: const Key('email'),
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
                              color: Colors.black,
                            ),
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
                              color: Colors.black,
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
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const password(),
                                    ),
                                  );
                                },
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
                                      // width: 16,
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
      localStorage.setString('token', body['token']);
      localStorage.setString('id', json.encode(body['data']['id']));
      localStorage.setString('name', json.encode(body['data']['name']));
      localStorage.setString('code', json.encode(body['data']['code']));
      //   localStorage.setString('teknisiId', jsonEncode(body['data']['code']));

      if (body['data']['code'] != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BerandaTeknisi()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const Beranda()),
        );
      }
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
