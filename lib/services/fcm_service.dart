import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:teknisi/ui/order.dart';
import 'package:teknisi/ui/profile/signup.dart';
import 'package:teknisi/ui/teknisi/history_teknisi.dart';

class FirebaseMessagingService {
  static final FirebaseMessaging _firebaseMessaging =
      FirebaseMessaging.instance;

  static Future<void> initialize() async {
    await Firebase.initializeApp();
    // Request permission untuk menerima notifikasi
    await _firebaseMessaging.requestPermission();
    await FirebaseMessaging.instance.subscribeToTopic('berita');

    // Handler untuk notifikasi saat aplikasi berada di foreground
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      showNotification(message);
    });

    // // Handler untuk notifikasi saat aplikasi berada di background atau ditutup
  }

  static void showNotification(RemoteMessage message) {
    // Tampilkan notifikasi sesuai dengan pesan FCM yang diterima
    // Anda dapat menggunakan package lain seperti flutter_local_notifications
    // untuk menampilkan notifikasi secara custom
  }

  static void handleNotificationClick(RemoteMessage message) {
    // Ambil data dari pesan FCM
    /// final notificationData = message.data;

    // Navigasi ke halaman yang sesuai berdasarkan data
    // if (notificationData['page'] == 'home') {
    // // Navigasi ke halaman utama (contoh: HomePage)
    Navigator.pushReplacement(
      GlobalKey<NavigatorState>().currentState!.context,
      MaterialPageRoute(builder: (context) => const Signup()),
    );
    print('berhasil dijalankan');
    // } else if (notificationData['page'] == 'profile') {
    //   // Navigasi ke halaman profil (contoh: ProfilePage)
    //   Navigator.pushReplacement(
    //     GlobalKey<NavigatorState>().currentState!.context,
    //     MaterialPageRoute(builder: (context) => ProfilePage()),
    //   );
    // }
  }
}
